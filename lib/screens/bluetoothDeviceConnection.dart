import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:track_pro/screens/bluetoothPairingSuccess.dart';

class Bluetoothdeviceconnection extends StatefulWidget {
  const Bluetoothdeviceconnection({super.key});

  @override
  State<Bluetoothdeviceconnection> createState() =>
      _BluetoothdeviceconnectionState();
}

class _BluetoothdeviceconnectionState extends State<Bluetoothdeviceconnection> {
  // bool isScanning = false;
  // BluetoothDevice? _connectedDevice;

  // @override
  // void initState() {
  //   super.initState();
  //   FlutterBluePlus.state.listen((state) {
  //     if (state == BluetoothState.on) {
  //       print("Bluetooth is ON");
  //       startBluetoothScanning(); // Proceed with scanning once Bluetooth is ON
  //     } else {
  //       print("Bluetooth is OFF. Please turn it ON.");
  //       // Optionally, prompt the user to enable Bluetooth
  //     }
  //   });
  //   hideSplashScreen();
  //   requestBluetoothPermissions(); // Request permissions here
  // }

  // // Request Bluetooth permissions at runtime for Android 12+
  // Future<void> requestBluetoothPermissions() async {
  //   // Request Bluetooth and location permissions
  //   PermissionStatus statusConnect =
  //       await Permission.bluetoothConnect.request();
  //   PermissionStatus statusScan = await Permission.bluetoothScan.request();
  //   PermissionStatus statusLocation =
  //       await Permission.locationWhenInUse.request();

  //   if (statusConnect.isGranted &&
  //       statusScan.isGranted &&
  //       statusLocation.isGranted) {
  //     print("Bluetooth permissions granted.");
  //     startBluetoothScanning(); // Start scanning once permissions are granted
  //   } else {
  //     print("Bluetooth permissions denied.");
  //     // Optionally, show a dialog to prompt the user to enable permissions
  //   }
  // }

  // // Method to hide the splash screen after a delay
  // Future<void> hideSplashScreen() async {
  //   Future.delayed(const Duration(seconds: 10), () {
  //     FlutterNativeSplash.remove();
  //   });
  // }

  // // Start scanning for Bluetooth devices
  // void startBluetoothScanning() async {
  //   if (await FlutterBluePlus.isAvailable == false) {
  //     print("Bluetooth not supported by this device");
  //     return;
  //   }

  //   FlutterBluePlus.state.listen((state) async {
  //     print("Bluetooth state: $state");
  //     if (state == BluetoothState.on) {
  //       print("Bluetooth is ON. Starting scan...");
  //       await initiateScan(); // Start scanning when Bluetooth is on
  //     } else {
  //       print("Bluetooth is off or in an error state, please turn it on.");
  //     }
  //   });
  // }

  // // Initiate Bluetooth scanning
  // Future<void> initiateScan() async {
  //   setState(() {
  //     isScanning = true;
  //   });

  //   FlutterBluePlus.scan().listen((scanResult) async {
  //     print("Scanning for devices...");

  //     if (scanResult.device.name == "TrackPro SmartWatch") {
  //       // Stop scanning once the device is found
  //       await FlutterBluePlus.stopScan();

  //       // Check if already connected to the same device
  //       if (_connectedDevice != null &&
  //           _connectedDevice!.id == scanResult.device.id) {
  //         print("Device already connected");
  //         return;
  //       }

  //       // Connect to the device
  //       await connectToDevice(scanResult.device);
  //     }
  //   });
  // }

  // // Connect to the Bluetooth device
  // Future<void> connectToDevice(BluetoothDevice device) async {
  //   try {
  //     print("Attempting to connect to device: ${device.name}");

  //     await device.connect();
  //     setState(() {
  //       _connectedDevice = device;
  //     });

  //     print("Connected to TrackPro Smartwatch!");

  //     // Show Snackbar after successful connection
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text("Successfully connected to Track Pro Smartwatch!"),
  //         duration: Duration(seconds: 3),
  //       ),
  //     );

  //     // Discover services after connection
  //     await discoverServices(device);

  //     // Navigate to Bluetooth pairing success screen
  //     Navigator.pushReplacement(
  //       context,
  //       MaterialPageRoute(builder: (ctx) => const Bluetoothpairingsuccess()),
  //     );
  //   } catch (e) {
  //     print("Connection failed: $e");
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text("Failed to connect to the device.")),
  //     );
  //   }
  // }

  // // Discover services and interact with characteristics
  // String serviceUUID =
  //     "0000180f-0000-1000-8000-00805f9b34fb"; // UUID for BLE Service
  // String characteristicUUID = "00002a19-0000-1000-8000-00805f9b34fb";

  // Future<void> discoverServices(BluetoothDevice device) async {
  //   try {
  //     var services = await device.discoverServices();
  //     for (var service in services) {
  //       print("Discovered service: ${service.uuid}");

  //       if (service.uuid.toString() == serviceUUID) {
  //         print("Found target service: $serviceUUID");

  //         for (var characteristic in service.characteristics) {
  //           print("Discovered characteristic: ${characteristic.uuid}");

  //           if (characteristic.uuid.toString() == characteristicUUID) {
  //             print("Found target characteristic: $characteristicUUID");

  //             // Start receiving notifications from the characteristic
  //             await characteristic.setNotifyValue(true);

  //             // **Add the following code snippet here:**
  //             characteristic.value.listen((value) {
  //               print("Received value from characteristic: $value");

  //               // Extract received data (assuming it's a string)
  //               String receivedData = String.fromCharCodes(value);

  //               // Check if connection is established
  //               if (_connectedDevice != null) {
  //                 // Navigate to the next page (replace with your actual page)
  //                 Navigator.pushReplacement(
  //                   context,
  //                   MaterialPageRoute(
  //                       builder: (ctx) => const Bluetoothpairingsuccess()),
  //                 );
  //               }
  //             });
  //           }
  //         }
  //       }
  //     }
  //   } catch (e) {
  //     print("Error discovering services: $e");
  //   }
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  //   // Disconnect from device and stop scan if widget is disposed
  //   if (_connectedDevice != null) {
  //     _connectedDevice!.disconnect();
  //   }
  //   FlutterBluePlus.stopScan();
  // }
  final _ble = FlutterReactiveBle();
  StreamSubscription<DiscoveredDevice>? _scanSub;
  StreamSubscription<ConnectionStateUpdate>? _connectSub;
  StreamSubscription<List<int>>? _notifySub;

  var _found = false;
  var _value = '';

  @override
  void initState() {
    super.initState();
    _checkPermissionsAndStartScan();
  }

  @override
  void dispose() {
    _notifySub?.cancel();
    _connectSub?.cancel();
    _scanSub?.cancel();
    super.dispose();
  }

  Future<void> _checkPermissionsAndStartScan() async {
    await Permission.locationWhenInUse.request();
    await Permission.bluetooth.request();
    await Permission.bluetoothScan.request();
    await Permission.bluetoothConnect.request();

    if (await Permission.locationWhenInUse.isGranted &&
        await Permission.bluetooth.isGranted &&
        await Permission.bluetoothScan.isGranted &&
        await Permission.bluetoothConnect.isGranted) {
      _scanSub = _ble.scanForDevices(withServices: []).listen(_onScanUpdate);
    } else {
      print('Permissions not granted.');
    }
  }

  void _onScanUpdate(DiscoveredDevice device) {
    print('Discovered device: ${device.name}, ID: ${device.id}');
    if (device.name == 'TrackPro SmartWatch' && !_found) {
      _found = true;
      _connectSub = _ble
          .connectToDevice(
        id: device.id,
        servicesWithCharacteristicsToDiscover: {
          Uuid.parse('00000000-5EC4-4083-81CD-A10B8D5CF6EC'): [
            Uuid.parse('00000001-5EC4-4083-81CD-A10B8D5CF6EC')
          ]
        },
        connectionTimeout: Duration(seconds: 30),
      )
          .listen(
        (update) {
          if (update.connectionState == DeviceConnectionState.connected) {
            _onConnected(device.id);
          } else if (update.connectionState ==
              DeviceConnectionState.disconnected) {
            print('Disconnected from device');
          }
        },
        onError: (e) {
          print('Connection error: $e');
        },
      );
    }
  }

  void _onConnected(String deviceId) {
    final characteristic = QualifiedCharacteristic(
      deviceId: deviceId,
      serviceId: Uuid.parse('00000000-5EC4-4083-81CD-A10B8D5CF6EC'),
      characteristicId: Uuid.parse('00000001-5EC4-4083-81CD-A10B8D5CF6EC'),
    );

    _notifySub = _ble.subscribeToCharacteristic(characteristic).listen((bytes) {
      setState(() {
        _value = const Utf8Decoder().convert(bytes);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (ctx) => const Bluetoothpairingsuccess()),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 3),
              child: Text(
                'Looking for The Track Pro',
                style: GoogleFonts.robotoFlex(
                  color: const Color(0xFF4A4D7A),
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 25),
            _value.isEmpty
                ? const SpinKitCircle(
                    color: Color(0xFFb7b7b7),
                    size: 340.0,
                  )
                : Text(_value, style: Theme.of(context).textTheme.titleLarge),
          ],
        ),
      ),
    );
  }
}
