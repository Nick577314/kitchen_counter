import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:kitchen_counter/data/food_data.dart'; // Import your food data model here

class PieChartWidget extends StatelessWidget {
  final Food? food; // Add this line to accept the selected food

  PieChartWidget({required this.food, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, double> dataMap = {
      'Calories': food?.calories ?? 0,
      'Fat': food?.fat ?? 0,
      'Protein': food?.protein ?? 0,
      'Carbohydrates': food?.carbohydrates ?? 0,
    };

    final List<Color> colorList = [
      Color.fromARGB(255, 129, 0, 47),
      Colors.yellow,
      Colors.purple,
      Colors.green,
    ];

    return Card(
      color: Colors.teal[400],
      elevation: 20.0,
      margin: EdgeInsets.symmetric(vertical: 50, horizontal: 150),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 30),
          Expanded(
            child: PieChart(
              dataMap: dataMap,
              animationDuration: Duration(milliseconds: 800),
              chartLegendSpacing: 32,
              chartRadius: MediaQuery.of(context).size.width / 5.2,
              colorList: colorList,
              initialAngleInDegree: 0,
              chartType: ChartType.disc,
              ringStrokeWidth: 32,
              legendOptions: LegendOptions(
                showLegendsInRow: false,
                legendPosition: LegendPosition.right,
                showLegends: true,
                legendShape: BoxShape.circle,
                legendTextStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              chartValuesOptions: ChartValuesOptions(
                showChartValueBackground: true,
                showChartValues: true,
                showChartValuesInPercentage: true,
                showChartValuesOutside: false,
                decimalPlaces: 2,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                //IndicatorsWidget()
              ),
            ],
          ),
        ],
      ),
    );
  }
}
