import 'package:flutter/material.dart';
import 'package:kitchen_counter/Screens/CalorieScreen.dart';
import 'package:kitchen_counter/Screens/ProfilePage/ProfileScreen.dart';

import 'package:kitchen_counter/Screens/HomeScreen.dart';

class Navigation extends StatelessWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Drawer(
        backgroundColor: Colors.teal[300],
        width: 200,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildHeader(context),
              buildMenuItems(context),
            ],
          ),
        ),
      );
}

Widget buildHeader(BuildContext context) {
  return Container(
    padding: EdgeInsets.only(
      top: MediaQuery.of(context).padding.top,
    ),
  );
}

Widget buildMenuItems(BuildContext context) {
  return Column(
    children: [
      ListTile(
        iconColor: Colors.white,
        textColor: Colors.white,
        leading: const Icon(Icons.home),
        title: const Text('Home'),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
          );
        },
      ),
      const Divider(thickness: 2.0, color: Colors.white70),
      ListTile(
        iconColor: Colors.white,
        textColor: Colors.white,
        leading: const Icon(Icons.star),
        title: const Text('Favorites'),
        onTap: () {},
      ),
      ListTile(
        iconColor: Colors.white,
        textColor: Colors.white,
        leading: const Icon(Icons.apple_outlined),
        title: const Text('Calorie Counter'),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    CalorieScreen()), // routes the button inside the naviagtion drawer to the Calorie counter screen
          );
        },
      ),
      ListTile(
        iconColor: Colors.white,
        textColor: Colors.white,
        leading: const Icon(Icons.person_2_sharp),
        title: const Text('Profile'),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    ProfileScreen()), // routes the button inside the naviagtion drawer to the profileScreen
          );
        },
      ),
    ],
  );
}
