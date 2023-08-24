// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:kitchen_counter/Screens/LoginScreen.dart';
import 'package:toast/toast.dart';

void main() {
  runApp(MaterialApp(
    title: "Kitchen Counter",
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return MaterialApp(
      title: "Login with signup",
      home: LoginScreen(),
    );
  }
}
