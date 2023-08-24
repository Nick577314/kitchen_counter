import 'dart:core';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

validateEmail(String _email) {
  final emailValid = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  return emailValid.hasMatch(_email);
}

alertdialog(String msg, {int? duration, int? gravity}) {
  Toast.show(msg,
      duration: Toast.lengthLong,
      backgroundColor: Colors.teal,
      gravity: Toast.center);
}
