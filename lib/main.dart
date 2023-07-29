// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kitchen_counter/home_page.dart';

void main() {
  runApp(MyApp());
}
// always need this

class MyApp extends StatelessWidget {
  // and this
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: HomePage(),
    );
  }
}
