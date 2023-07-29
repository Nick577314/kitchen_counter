import 'package:flutter/material.dart';
import 'package:kitchen_counter/Utility/button.dart';
import 'package:kitchen_counter/data/food_data.dart';

class DialogBox extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onSave;
  final VoidCallback onCancel;

  DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  void _handleSaveButtonPressed(BuildContext context) {
    String updatedTextValue = controller.text;
    onSave(updatedTextValue); // Pass the updated value when saving
    Navigator.of(context)
        .pop(updatedTextValue); // Close the dialog and pass the updated value
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.deepPurple[700],
      content: SizedBox(
        height: 120,
        child: Column(
          children: [
            const SizedBox(height: 20),
            Text(
              "Are you sure you would like to save?",
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyButton(
                  text: 'Save',
                  onPressed: () => _handleSaveButtonPressed(context),
                ),
                const SizedBox(width: 8),
                MyButton(text: 'Cancel', onPressed: onCancel),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DialogBox2 extends StatefulWidget {
  final TextEditingController controller;
  final List<Food> list;

  DialogBox2({
    super.key,
    required this.list,
    required this.controller,
  });
  @override
  _DialogBox2State createState() => _DialogBox2State();
}

class _DialogBox2State extends State<DialogBox2> {
  bool selected = false;
  List<Food> selectedFoods = [];

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.teal[600],
      title: Text(
        "Pick which food item best fits what you are looking for?",
        style: TextStyle(color: Colors.white, fontSize: 14),
        textAlign: TextAlign.center,
      ),
      content: SizedBox(
        height: 600,
        width: 400,
        child: Container(
          child: ListView.builder(
            itemCount: widget.list.length,
            itemBuilder: (context, index) {
              var food = widget.list[index];
              bool isSelected = selectedFoods.contains(food);
              return Card(
                color: isSelected ? Colors.tealAccent[100] : Colors.white,
                elevation: 4,
                child: ListTile(
                  title: Text(
                    food.foodname,
                  ),
                  textColor: Colors.black,
                  selected: widget.list.contains(food),
                  onTap: () {
                    setState(() {
                      if (selectedFoods.contains(food)) {
                        selectedFoods.remove(food);
                      } else {
                        selectedFoods.add(food);
                      }
                    });
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

List<Food> sendData(List<Food> foodlist) {
  return foodlist;
}
