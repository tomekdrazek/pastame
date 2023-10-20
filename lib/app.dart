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
    debugPrint("_onDetect: $barcode");
    DatabaseReference ref = database.ref("p/$barcode");
    DatabaseEvent ev = await ref.once();
    debugPrint("_onDetect Snapshot: ${ev.snapshot.value}");

    if (ev.snapshot.value != null) {
      setState(() {
        Map map = ev.snapshot.value as Map;
        _productDetails = ProductDetails(barcode: barcode, value: map);
        if (_productDetails != null && barcode != _barcode) {
          _selectedIndex = 1;
          _barcode = barcode;
        }
      });
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      if (_productDetails != null) {
        _selectedIndex = index;
      } else {
        _selectedIndex = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget body;
    if (_selectedIndex == 0 || _productDetails == null) {
      body = PastaBarcodeScanner(onDetect: _onDetect);
    } else if (_selectedIndex == 1) {
      ProductDetails details = _productDetails!;
      body = ProductPage(title: _barcode, details: details);
    } else {
      body = const Text("Unknown");
    }
    List<BottomNavigationBarItem> bottomNavBarItems = [];
    bottomNavBarItems.add(const BottomNavigationBarItem(
        icon: Icon(Icons.qr_code_scanner), label: "Scan"));
    if (_productDetails != null) {
      bottomNavBarItems.add(const BottomNavigationBarItem(
        icon: Icon(Icons.info_outline),
        label: "Product",
      ));
    }
    bottomNavBarItems.add(const BottomNavigationBarItem(
        icon: Icon(Icons.question_mark), label: "About"));
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: body,
      bottomNavigationBar: BottomNavigationBar(
          items: bottomNavBarItems,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped),
    );
  }
}
