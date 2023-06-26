import 'package:flutter/material.dart';
import 'package:learnflutter/widgets/drawer.dart';

import '../models/catalog.dart';
import '../widgets/item_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text("Catalog App"),
        elevation: 0.0,
      ),
      drawer: const MyDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: CatalogModel.items.length,
          itemBuilder: (BuildContext context, int index) {
            return ItemWidget(
              item: CatalogModel.items[index],
            );
          },
        ),
      ),
    );
  }
}
