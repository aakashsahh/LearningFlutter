import 'package:flutter/material.dart';
import 'package:learnflutter/screens/home.dart';
import 'package:learnflutter/screens/login_page.dart';
import 'package:learnflutter/utils/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      initialRoute: "/",
      routes: {
        "/":(context) => const LoginPage(),
        MyRoutes.homeRoute:(context) => const HomePage(),
        MyRoutes.loginRoute:(context) => const LoginPage(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.deepPurple,
      ),
    );
  }
}
