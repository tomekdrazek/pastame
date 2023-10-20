import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
// import 'package:mobile_scanner_example/scanner_error_widget.dart';

typedef BarcodeStringCallback = void Function(String code);

class PastaBarcodeScanner extends StatefulWidget {
  final BarcodeStringCallback onDetect;
  const PastaBarcodeScanner({super.key, required this.onDetect});
  @override
  State<PastaBarcodeScanner> createState() => _PastaBarcodeScannerState();
}

class _PastaBarcodeScannerState extends State<PastaBarcodeScanner>
    with SingleTickerProviderStateMixin {
  // Barcode? capture;
  String? lastCapture;
  _onDetect(BarcodeCapture capture) {
    final List<Barcode> barcodes = capture.barcodes;
    // final Uint8List? image = capture.image;
    for (final barcode in barcodes) {
      final String code = barcode.rawValue!;
      debugPrint('Barcode found! $code');
      widget.onDetect(code);
      setState(() {
        lastCapture = code;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MobileScanner(
        controller: MobileScannerController(
          detectionSpeed: DetectionSpeed.noDuplicates,
          facing: CameraFacing.back,
          torchEnabled: false,
        ),
        onDetect: _onDetect);
  }
}
