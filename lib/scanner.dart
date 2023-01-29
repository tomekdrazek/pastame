import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
// import 'package:mobile_scanner_example/scanner_error_widget.dart';

typedef BarcodeStringCallback = void Function(String code);

class PastaBarcodeScanner extends StatefulWidget {
  final BarcodeStringCallback onDetect;
  const PastaBarcodeScanner({Key? key, required this.onDetect})
      : super(key: key);
  @override
  State<PastaBarcodeScanner> createState() => _PastaBarcodeScannerState();
}

class _PastaBarcodeScannerState extends State<PastaBarcodeScanner>
    with SingleTickerProviderStateMixin {
  Barcode? capture;
  _onDetect(Barcode barcode, MobileScannerArguments? args) {
    if (barcode.rawValue == null) {
      debugPrint('Failed to scan Barcode');
    } else {
      final String code = barcode.rawValue!;
      debugPrint('Barcode found! $code');
      widget.onDetect(code);
    }
    setState(() {
      capture = barcode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MobileScanner(allowDuplicates: false, onDetect: _onDetect);
  }
}
