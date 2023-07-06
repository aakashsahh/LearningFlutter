import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          "Cart",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: const Icon(Icons.done),
              title: const Text("Product"),
              trailing: IconButton(onPressed: () {}, icon: const Icon(Icons.remove)),
            );
          },
        ),
      ),
      bottomNavigationBar: ButtonBar(
        alignment: MainAxisAlignment.spaceBetween,
        buttonPadding: const EdgeInsets.all(16),
        children: [
          const Text("\$999",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              )),
          ElevatedButton(
            onPressed: () {},
            child: const Text(
              "Pay",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          )
        ],
      ),
    );
  }
}
