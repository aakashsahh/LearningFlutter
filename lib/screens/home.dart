import 'package:flutter/material.dart';
import 'package:learnflutter/screens/cart_page.dart';
import 'package:learnflutter/widgets/drawer.dart';

import '../models/catalog.dart';
import 'detal_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Product> cartItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Catalog App",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
        ),
        elevation: 0.0,
      ),
      drawer: const MyDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CartPage(cartItems: cartItems),
            ),
          );
        },
        backgroundColor: const Color.fromARGB(255, 48, 14, 77),
        child: const Icon(
          Icons.shopping_cart,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder<List<Product>>(
          future: loadProducts(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Product> products = snapshot.data!;

              return ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  Product product = products[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailScreen(product: product),
                        ),
                      );
                    },
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            ListTile(
                              leading: Hero(
                                tag: Key(product.id.toString()),
                                child: Image.network(product.image),
                              ),
                              title: Text(product.name),
                              subtitle: Text(product.desc),
                              trailing: Text(
                                '\$${product.price}',
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            ButtonBar(
                              alignment: MainAxisAlignment.end,
                              buttonPadding: EdgeInsets.zero,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    addToCart(product);
                                  },
                                  child: const Text(
                                    "Add to Cart",
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }

  void addToCart(Product product) {
    setState(() {
      cartItems.add(product);
    });
  }
}


// import 'package:flutter/material.dart';
// import 'package:learnflutter/screens/cart_page.dart';
// import 'package:learnflutter/widgets/drawer.dart';

// import '../models/catalog.dart';
// import 'detal_screen.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           "Catalog App",
//           style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
//         ),
//         elevation: 0.0,
//       ),
//       drawer: const MyDrawer(),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => const CartPage(),
//               ));
//         },
//         backgroundColor: const Color.fromARGB(255, 48, 14, 77),
//         child: const Icon(
//           Icons.shopping_cart,
//         ),
//       ),
//       body: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: FutureBuilder<List<Product>>(
//             future: loadProducts(),
//             builder: (context, snapshot) {
//               if (snapshot.hasData) {
//                 List<Product> products = snapshot.data!;

//                 return ListView.builder(
//                   itemCount: products.length,
//                   itemBuilder: (context, index) {
//                     Product product = products[index];
//                     return InkWell(
//                       onTap: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => DetailScreen(product: product),
//                             ));
//                       },
//                       child: Card(
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Column(
//                             children: [
//                               ListTile(
//                                 leading: Hero(tag: Key(product.id.toString()), child: Image.network(product.image)),
//                                 title: Text(product.name),
//                                 subtitle: Text(product.desc),
//                                 trailing: Text('\$${product.price}',
//                                     style: const TextStyle(
//                                       fontSize: 20,
//                                       fontWeight: FontWeight.w400,
//                                     )),
//                               ),
//                               ButtonBar(
//                                 alignment: MainAxisAlignment.end,
//                                 buttonPadding: EdgeInsets.zero,
//                                 children: [
//                                   ElevatedButton(
//                                     onPressed: () {},
//                                     child: const Text(
//                                       "Add to Cart",
//                                       style: TextStyle(
//                                         fontSize: 16,
//                                       ),
//                                     ),
//                                   )
//                                 ],
//                               )
//                             ],
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                 );
//               } else if (snapshot.hasError) {
//                 return Text('Error: ${snapshot.error}');
//               } else {
//                 return const CircularProgressIndicator();
//               }
//             },
//           )),
//     );
//   }
// }
