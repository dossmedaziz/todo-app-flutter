import 'package:flutter/material.dart';
import 'package:todo/screens/my_app.dart';
void main() {
  runApp( MaterialApp(
      debugShowCheckedModeBanner: false,
    theme: ThemeData(
      brightness:  Brightness.light,
      primaryColor: Colors.purple,
      accentColor: Colors.lightGreen,
    ),
    home: const MyApp(),
  ));
}
