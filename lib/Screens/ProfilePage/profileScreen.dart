import 'package:flutter/material.dart';
import 'package:kitchen_counter/Screens/ProfilePage/profile_menu.dart';
import 'package:kitchen_counter/Screens/ProfilePage/updateprofile.dart';
import 'package:get/get.dart';
import 'package:kitchen_counter/Utility/NavigationDrawer.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _controller = TextEditingController();
  String _textValue = '';

  void updateTextValue(String newValue) {
    setState(() {
      _textValue = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        backgroundColor: Colors.deepPurple[700],
      ),
      drawer: const Navigation(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: const Image(
                          image: AssetImage("assets/weightphoto.jpg")),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.deepPurple,
                      ),
                      child: Icon(
                        Icons.edit_outlined,
                        size: 20.0,
                        color: Colors.white70,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                _textValue,
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () async {
                    final updatedTextValue = await Get.to(() => UpdateProfile(
                          controller: _controller,
                          onProfileUpdated: updateTextValue,
                        ));

                    if (updatedTextValue != null) {
                      setState(() {
                        _textValue = updatedTextValue;
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    side: BorderSide.none,
                    shape: const StadiumBorder(),
                  ),
                  child: const Text(
                    'Edit Profile',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Divider(),
              const SizedBox(height: 10),
              ProfileMenuWidget(
                title: 'Settings',
                icon: Icons.settings_outlined,
                onPress: () {},
              ),
              ProfileMenuWidget(
                title: "FAQ",
                icon: Icons.question_mark_rounded,
                onPress: () {},
              ),
              ProfileMenuWidget(
                title: "Logout",
                icon: Icons.keyboard_double_arrow_right_outlined,
                textColor: Colors.red,
                endIcon: false,
                onPress: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
