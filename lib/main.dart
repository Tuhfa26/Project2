import 'package:calculator_app/Homepage.dart';
import 'package:flutter/material.dart';
import 'Calculator.dart';

void main() {
  runApp(const MyApp());}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Calculator',
      home: Homepage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
