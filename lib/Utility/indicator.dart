// import 'package:flutter/material.dart';
// import 'package:namer_app/data/food_data.dart';

// class IndicatorsWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) => Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: NutritionData.data
//             .map(
//               (data) => Container(
//                 padding: EdgeInsets.symmetric(vertical: 2),
//                 child: new Column(
//                   children: [
//                     buildIndicator(color: Colors.black, text: 'temptext'),
//                     buildIndicator(color: Colors.red, text: 'temptext2'),
//                   ],
//                   // isSquare: true,
//                 ),
//               ),
//             )
//             .toList(),
//       );

//   Widget buildIndicator({
//     required Color color,
//     required String text,
//     bool isSquare = false,
//     double size = 16,
//     Color textColor = Colors.white,
//   }) =>
//       Row(
//         children: <Widget>[
//           Container(
//             width: size,
//             height: size,
//             decoration: BoxDecoration(
//               shape: isSquare ? BoxShape.rectangle : BoxShape.circle,
//               color: color,
//             ),
//           ),
//           const SizedBox(width: 8),
//           Text(
//             text,
//             style: TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.bold,
//               color: textColor,
//             ),
//           )
//         ],
//       );
// }
