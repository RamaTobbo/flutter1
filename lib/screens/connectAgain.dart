import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:track_pro/provider/sensorsData.dart';
import 'package:track_pro/screens/bluetoothPairingSuccess.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:track_pro/screens/tab.dart';

class Connectagain extends StatefulWidget {
  const Connectagain({super.key});

  @override
  State<Connectagain> createState() => _ConnectagainState();
}

class _ConnectagainState extends State<Connectagain> {
  bool bluetoothState = false;
  BluetoothDevice? selectedDevice;
  BluetoothCharacteristic? timeCharacteristic;
  BluetoothCharacteristic? pressureCharacteristic;
  BluetoothCharacteristic? temperatureCharacteristic;
  BluetoothCharacteristic? humidityCharacteristic;
  BluetoothCharacteristic? stepsCharacteristic;

  bool connectionStatus = false;
  bool isConnecting = false;

  String receivedTime = "No time yet"; // Variable to store the received time
  String receivedPressure = "No pressure yet";
  String receivedTemperature = "No temperature yet";
  String receivedHumidity = "No humidity yet";

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

  Future<void> saveReceivedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('receivedTime', receivedTime);
    await prefs.setString('receivedPressure', receivedPressure);
    await prefs.setString('receivedTemperature', receivedTemperature);
    await prefs.setString('receivedHumidity', receivedHumidity);
  }

  Future<void> connectToDevice(BluetoothDevice device) async {
    try {
      setState(() {
        isConnecting = true;
      });

      // Connect to the device
      await device.connect();

      // Discover services on the device
      List<BluetoothService> services = await device.discoverServices();
      print("Services discovered: ");
      services.forEach((service) {
        print("Service UUID: ${service.uuid}");
        service.characteristics.forEach((characteristic) {
          print("Characteristic UUID: ${characteristic.uuid}");
        });
      });

      // Try finding the sensor service
      BluetoothService? sensorService;
      try {
        sensorService = services.firstWhere((service) =>
            service.uuid.toString() == "00000000-5ec4-4083-81cd-a10b8d5cf6ec");
      } catch (e) {
        print("Sensor service not found: ${e.toString()}");
      }

      if (sensorService == null) {
        print("Sensor service not found!");
        return;
      }

      // Finding characteristics for time, pressure, temperature, and humidity
      timeCharacteristic = sensorService.characteristics.firstWhere(
        (char) =>
            char.uuid.toString() == "00000001-5ec4-4083-81cd-a10b8d5cf6ec",
      );
      stepsCharacteristic = sensorService.characteristics.firstWhere(
        (char) =>
            char.uuid.toString() == "00000006-5ec4-4083-81cd-a10b8d5cf6ec",
      );
      pressureCharacteristic = sensorService.characteristics.firstWhere(
        (char) =>
            char.uuid.toString() == "00000002-5ec4-4083-81cd-a10b8d5cf6ec",
      );
      temperatureCharacteristic = sensorService.characteristics.firstWhere(
        (char) =>
            char.uuid.toString() == "00000003-5ec4-4083-81cd-a10b8d5cf6ec",
      );
      humidityCharacteristic = sensorService.characteristics.firstWhere(
        (char) =>
            char.uuid.toString() == "00000004-5ec4-4083-81cd-a10b8d5cf6ec",
      );

      if (timeCharacteristic == null ||
          pressureCharacteristic == null ||
          temperatureCharacteristic == null ||
          humidityCharacteristic == null) {
        print("One or more characteristics not found!");
        return;
      }

      // Subscribe to notifications for time, pressure, temperature, and humidity
      await timeCharacteristic!.setNotifyValue(true);
      await pressureCharacteristic!.setNotifyValue(true);
      await temperatureCharacteristic!.setNotifyValue(true);
      await humidityCharacteristic!.setNotifyValue(true);

      // Listen for changes to each characteristic
      timeCharacteristic!.value.listen((value) {
        String timeString = String.fromCharCodes(value);
        setState(() {
          receivedTime = timeString;
        });
        saveReceivedData();
        Provider.of<BluetoothDataProvider>(context, listen: false)
            .setHumidity(receivedHumidity);
        print("Receivedd time: $timeString");
      });

      pressureCharacteristic!.value.listen((value) {
        String pressureString = String.fromCharCodes(value);
        setState(() {
          receivedPressure = pressureString;
        });
        saveReceivedData();
        Provider.of<BluetoothDataProvider>(context, listen: false)
            .setTime(receivedTime);
        print("Receivedd pressure: $pressureString");
      });

      temperatureCharacteristic!.value.listen((value) {
        String temperatureString = String.fromCharCodes(value);
        setState(() {
          receivedTemperature = temperatureString;
        });
        saveReceivedData();
        Provider.of<BluetoothDataProvider>(context, listen: false)
            .setPressure(receivedPressure);
        print("Receivedd temperature: $temperatureString");
      });

      humidityCharacteristic!.value.listen((value) {
        String humidityString = String.fromCharCodes(value);
        setState(() {
          receivedHumidity = humidityString;
        });
        saveReceivedData();
        Provider.of<BluetoothDataProvider>(context, listen: false)
            .setTemperature(receivedTemperature);
        print("Receivedd humidity: $humidityString");
      });

      // Update connection status
      setState(() {
        connectionStatus = true;
        isConnecting = false;
      });
    } catch (e) {
      setState(() {
        isConnecting = false;
      });
      print("Error connecting to device: $e");
      Provider.of<BluetoothDataProvider>(context, listen: false)
          .setPressure(receivedPressure);

      debugPrint("Received time: $receivedHumidity");
      debugPrint("Received pressure: $receivedPressure");
      debugPrint("Received temperature: $receivedTemperature");
      debugPrint("Received humidity: $receivedTime");
    }
  }

  // // Connect to the selected Bluetooth device and discover services
  // Future<void> connectToDevice(BluetoothDevice device) async {
  //   try {
  //     setState(() {
  //       isConnecting = true;
  //     });

  //     // Connect to the device
  //     await device.connect();

  //     // Discover services on the device
  //     List<BluetoothService> services = await device.discoverServices();
  //     print("Services discovered: ");
  //     services.forEach((service) {
  //       print("Service UUID: ${service.uuid}");
  //       service.characteristics.forEach((characteristic) {
  //         print("Characteristic UUID: ${characteristic.uuid}");
  //       });
  //     });

  //     // Try finding the time, pressure, temperature, and humidity services
  //     BluetoothService? sensorService;
  //     try {
  //       sensorService = services.firstWhere((service) =>
  //           service.uuid.toString() == "00000000-5ec4-4083-81cd-a10b8d5cf6ec");
  //     } catch (e) {
  //       print("Service not found: ${e.toString()}");
  //     }

  //     if (sensorService == null) {
  //       print("Sensor service not found!");
  //       return;
  //     }

  //     // Finding characteristics for time, pressure, temperature, and humidity
  //     timeCharacteristic = sensorService.characteristics.firstWhere(
  //       (char) =>
  //           char.uuid.toString() == "00000001-5ec4-4083-81cd-a10b8d5cf6ec",
  //     );
  //     pressureCharacteristic = sensorService.characteristics.firstWhere(
  //       (char) =>
  //           char.uuid.toString() == "00000002-5ec4-4083-81cd-a10b8d5cf6ec",
  //     );
  //     temperatureCharacteristic = sensorService.characteristics.firstWhere(
  //       (char) =>
  //           char.uuid.toString() == "00000003-5ec4-4083-81cd-a10b8d5cf6ec",
  //     );
  //     humidityCharacteristic = sensorService.characteristics.firstWhere(
  //       (char) =>
  //           char.uuid.toString() == "00000004-5ec4-4083-81cd-a10b8d5cf6ec",
  //     );

  //     if (timeCharacteristic == null ||
  //         pressureCharacteristic == null ||
  //         temperatureCharacteristic == null ||
  //         humidityCharacteristic == null) {
  //       print("One or more characteristics not found!");
  //       return;
  //     }

  //     // Explicitly read the characteristic's value
  //     List<int> timeValue = await timeCharacteristic!.read();
  //     String timeString = String.fromCharCodes(timeValue);

  //     List<int> pressureValue = await pressureCharacteristic!.read();
  //     String pressureString = String.fromCharCodes(pressureValue);

  //     List<int> temperatureValue = await temperatureCharacteristic!.read();
  //     String temperatureString = String.fromCharCodes(temperatureValue);

  //     List<int> humidityValue = await humidityCharacteristic!.read();
  //     String humidityString = String.fromCharCodes(humidityValue);

  //     print("Received time string: $timeString");
  //     print("Received pressure: $pressureString");
  //     print("Received temperature: $temperatureString");
  //     print("Received humidity: $humidityString");

  //     setState(() {
  //       receivedTime = timeString;
  //       receivedPressure = pressureString;
  //       receivedTemperature = temperatureString;
  //       receivedHumidity = humidityString;
  //     });

  //     setState(() {
  //       connectionStatus = true;
  //       isConnecting = false;
  //     });
  //   } catch (e) {
  //     setState(() {
  //       isConnecting = false;
  //     });
  //     print("Error connecting to device: $e");
  //   }
  // }

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
            SizedBox(
              height: 80,
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
                              side: BorderSide(color: Colors.black),
                            ),
                          ),
                          onPressed: () async {
                            setState(() {
                              isConnecting = true;
                            });
                            await connectToDevice(tempList[index].device);

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (ctx) => TabNav(
                                          index: 0,
                                        )));
                          },
                          child: Text(
                            "Connect",
                            style: TextStyle(color: Colors.black),
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

            // Display the received values on the UI
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    'Current Time: $receivedTime',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.amber),
                  ),
                  Text(
                    'Pressure: $receivedPressure',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Temperature: $receivedTemperature',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Humidity: $receivedHumidity',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
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
              child: Icon(Icons.stop, color: Colors.black),
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
