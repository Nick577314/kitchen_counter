import 'package:flutter/material.dart';
import 'package:kitchen_counter/Helper/Databasehelper.dart';
import 'package:kitchen_counter/Helper/helperfunc.dart';
import 'package:kitchen_counter/Utility/textform.dart';
import 'package:kitchen_counter/Screens/LoginScreen.dart';
import 'package:kitchen_counter/data/user.dart';
import 'package:kitchen_counter/data/person.dart';
import 'package:toast/toast.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({Key? key}) : super(key: key);

  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _formKey = new GlobalKey<FormState>();
  final _conUserId = TextEditingController();
  final _conUserName = TextEditingController();
  final _conPassword = TextEditingController();
  final _conConfirmPassword = TextEditingController();
  final _conEmail = TextEditingController();
  final _conName = TextEditingController();
  final _conWeight = TextEditingController();
  final _conHeight = TextEditingController();
  final _conAge = TextEditingController();
  final _conActivity = TextEditingController();
  var dbHelper;

  void initState() {
    super.initState();
    dbHelper = DatabaseHelper();
  }

  SignUp() {
    final form = _formKey.currentState;
    String uid = _conUserId.text;
    String uname = _conUserName.text;
    String uemail = _conEmail.text;
    String password = _conPassword.text;
    String ccpassword = _conConfirmPassword.text;
    String _ = _conUserId.text;

    String name = _conName.text;
    String weight = _conWeight.text;
    String height = _conHeight.text;
    String age = _conAge.text;
    String activitylevel = _conActivity.text;

    if (form != null && !form.validate()) {
      if (password != ccpassword) {
        //print("Password's did not match");
        alertdialog("Password's did not match");
      }
    } else {
      form?.save();
      User uModel = User(uid, uname, uemail, password);
      dbHelper.saveUserData(uModel).then((userData) {
        alertdialog("Successfully Saved");
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => LoginScreen()));
      }).catchError((error) {
        print(error);
        alertdialog("Error: Data Save Fail");
      });
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kitchen Counter"),
        backgroundColor: Colors.teal[600],
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 50.0),
                  //Image.asset("assets/Image/Logo"),
                  Text(
                    "Signup",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.teal[600],
                        fontSize: 30.0),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  getTextForm(
                      controller: _conUserId,
                      hintname: "User ID",
                      icon: Icons.person),
                  SizedBox(height: 5.0),
                  getTextForm(
                      controller: _conUserName,
                      inputType: TextInputType.name,
                      hintname: "Username",
                      icon: Icons.person),
                  SizedBox(height: 5.0),
                  getTextForm(
                      controller: _conEmail,
                      inputType: TextInputType.emailAddress,
                      hintname: "Email",
                      icon: Icons.email),
                  SizedBox(height: 5.0),
                  getTextForm(
                      controller: _conPassword,
                      hintname: "Password",
                      icon: Icons.lock),

                  SizedBox(height: 5.0),
                  getTextForm(
                      controller: _conConfirmPassword,
                      hintname: "Confirm Password",
                      icon: Icons.lock),
                  Container(
                    margin: EdgeInsets.all(30.0),
                    width: double.infinity,
                    child: TextButton(
                      child: Text(
                        'Signup',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        SignUp();
                      },
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
                      Text("You have an account? "),
                      TextButton(
                        style: ButtonStyle(
                            textStyle: MaterialStateProperty.all<TextStyle>(
                                TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.teal[400]))),
                        child: Text(
                          'Sign In',
                          style: TextStyle(color: Colors.teal),
                          selectionColor: Colors.tealAccent,
                        ),
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (_) => LoginScreen()),
                              (Route<dynamic> route) => false);
                        },
                      )
                    ],
                  ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
