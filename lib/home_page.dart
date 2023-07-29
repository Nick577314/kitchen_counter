import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kitchen_counter/Utility/NavigationDrawer.dart';
import 'package:kitchen_counter/Utility/pie_chart.dart';
import 'package:kitchen_counter/data/food_data.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Food? selectedFood;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text("HomePage"),
          backgroundColor: Colors.teal[600],
        ),
        backgroundColor: Colors.teal[600],
        drawer: const Navigation(),
        body: Center(
          child: Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(150), // To make the container a circle
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0, 2),
                  blurRadius: 6.0,
                ),
              ],
            ),
            child: Center(
              child: Transform.scale(
                scale: 2.0,
                child: PieChartWidget(food: selectedFood),
              ),
            ),
          ),
        ),
      );
}
