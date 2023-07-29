// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kitchen_counter/Utility/Widget/NavigationDrawer.dart';

void main() {
  runApp(MyApp());
}
// always need this

class MyApp extends StatelessWidget {
  // and this
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'My App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text("HomePage"),
          backgroundColor: Colors.teal[600],
        ),
        backgroundColor: Colors.teal[300],
        drawer: const Navigation(),
      );
}
