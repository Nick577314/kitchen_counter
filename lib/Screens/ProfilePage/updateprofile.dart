import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kitchen_counter/Utility/dialog_box.dart';

class UpdateProfile extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onProfileUpdated;

  UpdateProfile(
      {required this.controller, required this.onProfileUpdated, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[700],
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.keyboard_arrow_left_rounded)),
        title:
            Text("Edit Profile", style: Theme.of(context).textTheme.bodyMedium),
      ),
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
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
                            image: AssetImage("assets/weightphoto.jpg"))),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.deepPurple),
                        child: Icon(Icons.camera_alt_outlined,
                            size: 20.0, color: Colors.white)),
                  )
                ],
              ),
              const SizedBox(height: 50),
              Column(
                children: [
                  SizedBox(
                    child: TextFormField(
                      controller: controller,
                      decoration: InputDecoration(
                          label: Text("Full Name"),
                          prefixIcon: Icon(Icons.person_2_outlined),
                          border: OutlineInputBorder()),
                    ),
                  ),
                  const SizedBox(height: 50),
                  SizedBox(
                    child: TextFormField(
                      decoration: InputDecoration(
                          label: Text("Email"),
                          prefixIcon: Icon(Icons.email_outlined),
                          border: OutlineInputBorder()),
                    ),
                  ),
                  const SizedBox(height: 50),
                  SizedBox(
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () => dialogProfilebox(context),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple[700],
                          side: BorderSide.none,
                          shape: const StadiumBorder()),
                      child: const Text(
                        'Save Profile',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void dialogProfilebox(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: controller,
          onSave: (updatedValue) {
            onProfileUpdated(updatedValue);
            Navigator.of(context).pop(); // Close the dialog box
          },
          onCancel: () => Navigator.of(context).pop(), // Close the dialog box
        );
      },
    );
  }
}
