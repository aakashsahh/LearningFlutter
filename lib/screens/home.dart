import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Text("Welcome to homepage"),
      ),
    );
  }
}
