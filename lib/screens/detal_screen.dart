import 'package:flutter/material.dart';

import '../models/catalog.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Hero(tag: Key(product.id.toString()), child: Image.network(product.image)),
            ],
          ),
        ),
      ),
    );
  }
}
