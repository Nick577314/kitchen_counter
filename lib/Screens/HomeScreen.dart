import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kitchen_counter/Utility/NavigationDrawer.dart';
import 'package:kitchen_counter/Utility/pie_chart.dart';
import 'package:kitchen_counter/data/food_data.dart';

class HomeScreen extends StatefulWidget {
  final Food? selectedFood;

  HomeScreen({this.selectedFood});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Food? selectedFood;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text("HomeScreen"),
          backgroundColor: Colors.teal[600],
        ),
        backgroundColor: Colors.teal[200],
        drawer: const Navigation(),
        body: Column(
          children: [
            Container(
              width: 1000,
              height: 400,
              child: Transform.scale(
                scale: 1.0,
                child: PieChartWidget(food: widget.selectedFood),
              ),
            ),
            Container(
              child: Card(
                color: Colors.teal[400],
                elevation: 20.0,
              ),
            )
          ],
        ),
      );
}
