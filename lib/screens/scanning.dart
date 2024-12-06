import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:track_pro/screens/BluetoothPairingSuccess.dart';

class QrCodeScanner extends StatelessWidget {
  QrCodeScanner({
    required this.setResult,
    super.key,
  });

  final Function setResult;
  final MobileScannerController controller = MobileScannerController();

  final String expectedQRCodeValue = "track_pro";

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        MobileScanner(
          controller: controller,
          onDetect: (BarcodeCapture capture) async {
            final List<Barcode> barcodes = capture.barcodes;
            final barcode = barcodes.first;

            if (barcode.rawValue != null) {
              if (barcode.rawValue == expectedQRCodeValue) {
                setResult(barcode.rawValue);

                await controller.stop();
                controller.dispose();

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const Bluetoothpairingsuccess()),
                );
              }
            }
          },
        ),
        Center(
          child: Container(
            width: 250,
            height: 250,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.amber,
                width: 5,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }
}
