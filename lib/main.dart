// import 'package:cocktail_app/drinks_providor.dart';
import 'package:cocktail_app/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CockTail App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(
        name: 'Adeel Zahid',
      ),
      // home: DrinksProvidor(),
    );
  }
}
