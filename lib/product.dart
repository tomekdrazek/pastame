import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

class ProductPage extends StatefulWidget {
  ProductPage({super.key, required this.title, required this.details});
  String title = "Default Title";
  Object? details;
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
