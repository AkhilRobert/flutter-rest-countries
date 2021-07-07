import 'package:countries/screens/detail.dart';
import 'package:countries/screens/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/": (context) => Home(),
        "/detail": (context) => Detail(),
      },
    );
  }
}
