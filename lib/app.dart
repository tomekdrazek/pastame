import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'scanner.dart';
import 'product.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  String _barcode = "";
  ProductDetails? _productDetails;
  final FirebaseDatabase database = FirebaseDatabase.instance;

  void _onDetect(String barcode) async {
    DatabaseReference ref = database.ref("p/$barcode");
    DatabaseEvent ev = await ref.once();
    setState(() {
      _productDetails = ProductDetails.fromSnapshot(ev.snapshot);
      _barcode = barcode;
      if (_productDetails != null) {
        _selectedIndex = 1;
      }
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget body;
    if (_selectedIndex == 0) {
      body = PastaBarcodeScanner(onDetect: _onDetect);
    } else {
      body = ProductPage(title: _barcode, details: _productDetails);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: body,
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
      bottomNavigationBar:
          BottomNavigationBar(items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(Icons.qr_code_scanner), label: "Scan"),
        BottomNavigationBarItem(
            icon: Icon(Icons.info_outline), label: "Product"),
      ], currentIndex: _selectedIndex, onTap: _onItemTapped),
    );
  }
}
