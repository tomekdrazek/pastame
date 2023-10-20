import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
class ProductDetails {
  String barcode = "";
  String brand = "";
  bool loaded = false;
  ProductDetails({required String barcode, required Map value}) {
    barcode = barcode;
    brand = value['brand'] ?? '';
  }
  // String product;
  // String type;
  // int cookingTimeNormal, cookingTimeAlDente;
  // ProductDetails.fromSnapshot(DataSnapshot snapshot)
  @override
  String toString() {
    return 'Brand: $brand';
  }
}

class ProductPage extends StatefulWidget {
  ProductPage({super.key, required this.title, required this.details});
  String title = "Default Title";
  ProductDetails details;
  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'Product:',
          ),
          Text(
            '[${widget.title}]',
            style: Theme.of(context).textTheme.headline4,
          ),
          Text('${widget.details ?? "Missing"}')
        ],
      ),
    );
  }
}
