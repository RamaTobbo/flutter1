import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(MaterialApp(home: SelectBluetoothDevice()));
}

class SelectBluetoothDevice extends StatefulWidget {
  @override
  _SelectBluetoothDeviceState createState() => _SelectBluetoothDeviceState();
}

class _SelectBluetoothDeviceState extends State<SelectBluetoothDevice> {
  bool bluetoothState = false;
  BluetoothDevice? selectedDevice;
  BluetoothCharacteristic? timeCharacteristic;
  bool connectionStatus = false;
  bool isConnecting = false;

  @override
  void initState() {
    super.initState();
    getPermissions();
    FlutterBluePlus.adapterState.listen((state) {
      setState(() {
        bluetoothState = state == BluetoothAdapterState.on;
      });
    });
  }

  // Function to request necessary permissions
  Future<void> getPermissions() async {
    try {
      await Permission.bluetooth.request();
      await Permission.locationWhenInUse.request(); // For scanning Bluetooth
    } catch (e) {
      print("Error requesting permissions: $e");
    }
  }

  // Connect to the selected Bluetooth device
  Future<void> connectToDevice(BluetoothDevice device) async {
    try {
      setState(() {
        isConnecting = true;
      });

      // Connect to the device
      await device.connect();

      // Discover services on the device
      List<BluetoothService> services = await device.discoverServices();
      BluetoothService timeService = services.firstWhere((service) {
        return service.uuid.toString() ==
            "00000000-5EC4-4083-81CD-A10B8D5CF6EC";
      });

      // Find the characteristic
      timeCharacteristic = timeService.characteristics.firstWhere((char) {
        return char.uuid.toString() == "00000001-5EC4-4083-81CD-A10B8D5CF6EC";
      });

      // Example: Read value from the characteristic
      List<int> value = await timeCharacteristic!.read();
      print("Read value: $value");

      // Setting up notifications to receive data
      await timeCharacteristic!.setNotifyValue(true);
      timeCharacteristic!.value.listen((value) {
        print("Received notification: $value");
      });

      setState(() {
        connectionStatus = true;
        isConnecting = false;
      });
    } catch (e) {
      setState(() {
        isConnecting = false;
      });
      print("Failed to connect or interact with the device: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to connect to device.")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Select Bluetooth Device")),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // Bluetooth activation status switch
            StreamBuilder(
              stream: FlutterBluePlus.adapterState,
              builder: (context, snapshot) {
                if (snapshot.data != null) {
                  return Container(
                    height: 30,
                    child: SwitchListTile(
                      activeColor: Color(0xFF015164),
                      activeTrackColor: Color(0xFF0291B5),
                      inactiveTrackColor: Colors.grey,
                      inactiveThumbColor: Colors.white,
                      title: Text('Activate Bluetooth',
                          style: TextStyle(fontSize: 14)),
                      value: bluetoothState,
                      onChanged: (bool value) {
                        setState(() {
                          bluetoothState = value;
                          if (value) {
                            FlutterBluePlus.turnOn();
                          } else {
                            FlutterBluePlus.turnOff();
                          }
                        });
                      },
                    ),
                  );
                } else {
                  return Container();
                }
              },
            ),

            // Device scan results
            StreamBuilder<List<ScanResult>>(
              stream: FlutterBluePlus.scanResults,
              initialData: const [],
              builder: (context, snapshot) {
                List<ScanResult> scanResults = snapshot.data!;
                List<ScanResult> tempList = scanResults
                    .where((element) => element.device.name.isNotEmpty)
                    .toList();

                return Container(
                  height: 700,
                  child: ListView.builder(
                    itemCount: tempList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(tempList[index].device.name),
                        leading: Icon(Icons.devices),
                        trailing: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              side: BorderSide(color: Colors.orange),
                            ),
                          ),
                          onPressed: () async {
                            setState(() {
                              isConnecting = true;
                            });
                            await connectToDevice(tempList[index].device);
                          },
                          child: Text(
                            "Connect",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),

            // Show loading indicator if connecting
            if (isConnecting)
              Center(
                child: CircularProgressIndicator(),
              ),
          ],
        ),
      ),

      // Scan button for Bluetooth devices
      floatingActionButton: StreamBuilder<bool>(
        stream: FlutterBluePlus.isScanning,
        initialData: false,
        builder: (context, snapshot) {
          if (snapshot.data!) {
            return FloatingActionButton(
              child: Icon(Icons.stop, color: Colors.red),
              onPressed: () => FlutterBluePlus.stopScan(),
              backgroundColor: Color(0xFFEDEDED),
            );
          } else {
            return FloatingActionButton(
              child: Icon(Icons.search, color: Colors.blue.shade300),
              backgroundColor: Color(0xFFEDEDED),
              onPressed: () =>
                  FlutterBluePlus.startScan(timeout: Duration(seconds: 4)),
            );
          }
        },
      ),
    );
  }
}

class SelectedDevice {
  BluetoothDevice? device;
  int? state;

  SelectedDevice(this.device, this.state);
}
