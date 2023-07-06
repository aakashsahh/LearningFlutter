import 'package:flutter/material.dart';
import '../models/catalog.dart';

class CartPage extends StatefulWidget {
  final List<Product> cartItems;

  const CartPage({Key? key, required this.cartItems}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text("Cart"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: widget.cartItems.length,
          itemBuilder: (context, index) {
            Product product = widget.cartItems[index];
            return ListTile(
              leading: Image.network(product.image),
              title: Text(product.name),
              subtitle: Text('\$${product.price}'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                      onPressed: () {
                        setState(() {
                          if (product.quantity > 1) {
                            product.quantity--;
                          } else {
                            widget.cartItems.removeAt(index);
                          }
                        });
                      },
                      icon: const Icon(Icons.remove)),
                  Text(product.quantity.toString()),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          product.quantity++;
                        });
                      },
                      icon: const Icon(Icons.add)),
                ],
              ),
              onLongPress: () {
                removeFromCart(product);
              },
            );
          },
        ),
      ),
      bottomNavigationBar:
          ButtonBar(alignment: MainAxisAlignment.spaceBetween, buttonPadding: const EdgeInsets.all(16), children: [
        Text('Total Price: \$${calculateTotalPrice().toDouble()}',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            )),
        ElevatedButton(
          onPressed: () {
            setState(() {
              widget.cartItems.clear();
            });
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Not supported yet")));
          },
          child: const Text(
            "Pay",
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        )
      ]),
    );
  }

  void removeFromCart(Product product) {
    setState(() {
      widget.cartItems.remove(product);
    });
  }

  void clearCart() {
    setState(() {
      widget.cartItems.clear();
    });
  }

  double calculateTotalPrice() {
    double totalPrice = 0;
    for (Product product in widget.cartItems) {
      totalPrice += product.price * product.quantity;
    }
    return totalPrice;
  }
}
