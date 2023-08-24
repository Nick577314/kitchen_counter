import 'package:flutter/material.dart';
import 'package:kitchen_counter/Utility/textform.dart';

class CreateProfileScreen extends StatefulWidget {
  const CreateProfileScreen({Key? key}) : super(key: key);

  @override
  _CreateProfileState createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfileScreen> {
  final _userid = TextEditingController();
  final _name = TextEditingController();
  final _weight = TextEditingController();
  final _height = TextEditingController();
  final _activitylevel = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kitchen Counter"),
        backgroundColor: Colors.teal[600],
      ),
      body: SingleChildScrollView(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            getTextForm(
                controller: _userid, hintname: "User Id", icon: Icons.person),
            SizedBox(
              height: 10,
            ),
            getTextForm(
                controller: _name, hintname: "Name", icon: Icons.person),
            SizedBox(
              height: 10,
            ),
            getTextForm(
                controller: _height, hintname: "Height", icon: Icons.height),
            SizedBox(
              height: 10,
            ),
            getTextForm(
                controller: _height,
                hintname: "Weight",
                icon: Icons.monitor_weight_sharp),
            SizedBox(
              height: 10,
            ),
            getTextForm(
              controller: _activitylevel,
              hintname: "Activity Level",
              icon: Icons.monitor_heart_sharp,
            ),
          ],
        ),
      )),
    );
  }
}
