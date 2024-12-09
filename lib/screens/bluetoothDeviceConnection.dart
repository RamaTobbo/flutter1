import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:track_pro/screens/bluetoothPairingSuccess.dart';

class Bluetoothdeviceconnection extends StatefulWidget {
  const Bluetoothdeviceconnection({super.key});

  @override
  State<Bluetoothdeviceconnection> createState() =>
      _BluetoothdeviceconnectionState();
}

class _BluetoothdeviceconnectionState extends State<Bluetoothdeviceconnection> {
  bool isScanning = false;
  BluetoothDevice? _connectedDevice;

  @override
  void initState() {
    super.initState();
    hideScreen();
    startBluetoothScanning();
  }

  void startBluetoothScanning() async {
    // Check if Bluetooth is supported on this device
    if (await FlutterBluePlus.isAvailable == false) {
      print("Bluetooth not supported by this device");
      return;
    }

    // Listen for Bluetooth state changes
    FlutterBluePlus.state.listen((state) {
      print("Bluetooth state: $state");
      if (state == BluetoothState.on) {
        print("Bluetooth is ON. Starting scan...");
        startScan();
      } else {
        print("Bluetooth is off or in an error state, please turn it on.");
      }
    });
  }

  // Start scanning for devices
  void startScan() {
    setState(() {
      isScanning = true;
    });

    FlutterBluePlus.scan().listen((scanResult) async {
      print("Scanning for devices...");

      if (scanResult.device.name == "TrackPro SmartWatch") {
        // Stop scanning once the device is found
        FlutterBluePlus.stopScan();

        // Check if the device is already connected
        if (_connectedDevice != null &&
            _connectedDevice!.id == scanResult.device.id) {
          print("Device already connected");
          return;
        }

        // Connect to the device
        await connectToDevice(scanResult.device);
      }
    });
  }

  // Connect to the Bluetooth device
  Future<void> connectToDevice(BluetoothDevice device) async {
    try {
      print("Attempting to connect to device: ${device.name}");

      await device.connect();
      setState(() {
        _connectedDevice = device;
      });
      print("Connected to TrackPro Smartwatch!");

      // Show Snackbar after connection
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Successfully connected to Track Pro Smartwatch!"),
          duration: Duration(seconds: 3),
        ),
      );

      // Discover services after connection
      await discoverServices(device);

      // Navigate to the Bluetooth pairing success page
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (ctx) => const Bluetoothpairingsuccess()),
      );
    } catch (e) {
      print("Connection failed: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to connect to the device.")),
      );
    }
  }

  // Discover services and interact with characteristics
  String serviceUUID = '12345678-1234-1234-1234-123456789abc';
  String characteristicUUID = '87654321-4321-4321-4321-abcdefabcdef';

  Future<void> discoverServices(BluetoothDevice device) async {
    try {
      var services = await device.discoverServices();
      for (var service in services) {
        print("Discovered service: ${service.uuid}");

        if (service.uuid.toString() == serviceUUID) {
          print("Found target service: $serviceUUID");

          for (var characteristic in service.characteristics) {
            print("Discovered characteristic: ${characteristic.uuid}");

            if (characteristic.uuid.toString() == characteristicUUID) {
              print("Found target characteristic: $characteristicUUID");

              // Start receiving notifications
              await characteristic.setNotifyValue(true);

              characteristic.value.listen((value) {
                print("Received value from characteristic: $value");
              });
            }
          }
        }
      }
    } catch (e) {
      print("Error discovering services: $e");
    }
  }

  // Method to hide the splash screen and navigate after a delay
  Future<void> hideScreen() async {
    Future.delayed(const Duration(seconds: 10), () {
      FlutterNativeSplash.remove();
    });
  }

  @override
  void dispose() {
    super.dispose();
    // Optionally, disconnect from the device when the widget is disposed
    if (_connectedDevice != null) {
      _connectedDevice!.disconnect();
    }
    FlutterBluePlus.stopScan();
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
            const SpinKitCircle(
              color: Color(0xFFb7b7b7),
              size: 340.0,
            ),
          ],
        ),
      ),
    );
  }
}
