import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class Product {
  late final int id;
  final String name;
  final String desc;
  final int price;
  final String color;
  final String image;
  int quantity = 1;

  Product({
    required this.id,
    required this.name,
    required this.desc,
    required this.price,
    required this.color,
    required this.image,
  });
}

Future<List<Product>> loadProducts() async {
  String jsonString = await rootBundle.loadString("assets/files/catalog.json");
  List<dynamic> data = json.decode(jsonString)['products'];

  List<Product> products = data.map((productData) {
    return Product(
      id: productData['id'],
      name: productData['name'],
      desc: productData['desc'],
      price: productData['price'],
      color: productData['color'],
      image: productData['image'],
    );
  }).toList();

  return products;
}
