import 'package:flutter/material.dart';
import 'package:kitchen_counter/Helper/helperfunc.dart';
import 'package:kitchen_counter/Screens/HomeScreen.dart';
import 'package:kitchen_counter/Screens/ProfilePage/CreateProfileScreen.dart';
import 'package:kitchen_counter/Screens/SignupScreen.dart';
import 'package:kitchen_counter/Utility/textform.dart';
import 'package:kitchen_counter/Helper/Databasehelper.dart';
import 'package:kitchen_counter/data/person.dart';
import 'package:kitchen_counter/data/user.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _conUserId = TextEditingController();
  final _conPassword = TextEditingController();
  var dbHelper;

  void initState() {
    super.initState();
    dbHelper = DatabaseHelper();
  }

  login() async {
    String uid = _conUserId.text;
    String password = _conPassword.text;
    if (uid.isEmpty) {
      alertdialog("Please enter your User Id");
    } else if (password.isEmpty) {
      alertdialog("Please enter your Password");
    } else {
      await dbHelper.getLoginData(uid, password).then((UserData) {
        // if (UserData != null) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => HomeScreen()),
            (Route<dynamic> route) => false);
        if (UserData == null) {
          alertdialog("Error: User not Found");
        }
      }).catchError((error) {
        print(error);
        alertdialog("Error: Login Fail");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kitchen Counter"),
        backgroundColor: Colors.teal[600],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 50.0),
                //Image.asset("assets/Image/Logo"),
                Text(
                  "Login",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.teal[600],
                      fontSize: 30.0),
                ),
                getTextForm(
                    controller: _conUserId,
                    hintname: "User ID",
                    icon: Icons.person),
                SizedBox(height: 5.0),
                getTextForm(
                  controller: _conPassword,
                  hintname: "Password",
                  icon: Icons.lock,
                  isobscuretext: true,
                ),
                Container(
                  margin: EdgeInsets.all(30.0),
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {
                      login();
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                Container(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account? "),
                    TextButton(
                      style: ButtonStyle(
                          textStyle: MaterialStateProperty.all<TextStyle>(
                              TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.teal[400]))),
                      child: Text(
                        'Sign up',
                        style: TextStyle(color: Colors.teal),
                        selectionColor: Colors.tealAccent,
                      ),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => SignupForm()));
                      },
                    )
                  ],
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
