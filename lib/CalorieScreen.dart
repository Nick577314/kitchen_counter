import 'package:flutter/material.dart';
import 'package:kitchen_counter/Utility/Widget/NavigationDrawer.dart';
import 'package:kitchen_counter/Utility/Widget/pie_chart.dart';
import 'package:kitchen_counter/Utility/dialog_box.dart';
import 'package:kitchen_counter/data/food_data.dart';
import 'package:kitchen_counter/api/food_api.dart';

class CalorieScreen extends StatelessWidget {
  final _controller1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calorie Tracker"),
        backgroundColor: Colors.teal[600],
      ),
      backgroundColor: Colors.teal[300],
      drawer: const Navigation(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            alignment: Alignment.topCenter,
            width: 300,
            height: 300,
            child: Transform.scale(scale: 1.0, child: PieChartWidget()),
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: Colors.teal[600],
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 250),
              elevation: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  Container(
                    width: 200,
                    height: 50,
                    child: TextFormField(
                      controller: _controller1,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        labelText: 'Search Food',
                        labelStyle: TextStyle(color: Colors.white),
                        prefixIcon: Icon(Icons.add),
                        prefixIconColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusColor: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    width: 130,
                    height: 30,
                    child: ElevatedButton(
                      onPressed: () async {
                        var foodName = _controller1.text;
                        // print("i'm in caloriescreen for " + foodName);
                        List<Food> foodList = await searchFoodData(foodName);

                        foodListbox(context, foodList);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal[400],
                      ),
                      child: const Text(
                        'Enter',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void foodListbox(BuildContext context, List<Food> food) {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox2(
          controller: _controller1,
          list: food,

          // onCancel: () {},
          // onSave: (p0) {},

          // Close the dialog box

          // onCancel: () => Navigator.of(context).pop(), // Close the dialog box
        );
      },
    );
  }
}
