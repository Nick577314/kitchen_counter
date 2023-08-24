import 'package:flutter/material.dart';
import 'package:kitchen_counter/Helper/helperfunc.dart';

class getTextForm extends StatelessWidget {
  TextEditingController controller;
  String hintname;
  IconData icon;
  bool isobscuretext;
  TextInputType inputType;

  getTextForm(
      {required this.controller,
      required this.hintname,
      required this.icon,
      this.isobscuretext = false,
      this.inputType = TextInputType.none});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      margin: EdgeInsets.only(top: 10.0),
      child: TextFormField(
        controller: controller,
        obscureText: isobscuretext,
        keyboardType: TextInputType.text,
        validator: (value) {
          // if value is 'null' or value is empty meaning nothing was typed into the field
          //it will return a custom message depending on what the hintname was for the textfield
          if (value == null || value.isEmpty) {
            return 'Please enter $hintname';
          }
          // if the hintname is equal to "Email" and validateEmail function doesn't return a true value
          if (hintname == "Email" && !validateEmail(value)) {
            return 'Please Enter a valid Email';
          }
          return null;
        },
        onSaved: (val) {
          if (val != null) {
            controller.text = val;
          }
        },
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            borderSide: BorderSide(color: Colors.transparent),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            borderSide: BorderSide(color: Colors.teal),
          ),
          prefixIcon: Icon(
            icon,
            color: Colors.teal,
          ),
          hintText: hintname,
          labelText: hintname,
          labelStyle: TextStyle(color: Colors.teal),
          fillColor: Colors.grey[150],
          filled: true,
        ),
      ),
    );
  }
}
