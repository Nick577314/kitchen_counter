import 'package:http/http.dart' as http;
import 'package:kitchen_counter/api/keys.dart';
import 'dart:convert';
import 'package:kitchen_counter/data/food_data.dart';
import 'dart:core';

// two seperate functions searchFoodData is the main function and searchNutritionData is the support function
//SearchFoodData will as the name implies take the text returned from the text controller
// and then pass the name in search the food while the second call to the function
Future<List<Food>> searchFoodData(String foodName) async {
  var secretloader = SecretLoader(secretPath: "secrets.json");
  Secret secret = await secretloader.load();

  final firstURL = 'https://api.edamam.com/api/food-database/v2/parser';
  final secondURL = 'https://api.edamam.com/api/food-database/v2/nutrients';

  final queryParameters1 = {
    'app_id': secret.appID,
    'app_key': secret.apiKey,
    'ingr': foodName,
    'nutrition-type': 'logging',
  };

  var uri1 = Uri.parse('$firstURL').replace(queryParameters: queryParameters1);
  final response = await http.get(uri1);

  print(uri1);

  if (response.statusCode == 200) {
    // if the request was successful then it will return the value of 200
    var responseData = jsonDecode(response.body);
    var hintsVar = responseData['hints'];
    List<Food> nutritionDataList = [];

    for (final e in hintsVar) {
      var foodVar = e['food'];
      var foodID = foodVar['foodId'];
      var foodName = foodVar['knownAs'];
      var nutritionData = await searchNutritionData(foodID, foodName);
      nutritionDataList.add(nutritionData);
    }

    return nutritionDataList;
  } else {
    print('Request failed with status: ${response.statusCode}');
    throw Exception('Failed to retrieve nutrition data for $foodName');
  }
}

Future<Food> searchNutritionData(String foodID, String foodName) async {
  var secretloader = SecretLoader(secretPath: "secrets.json");
  Secret secret = await secretloader.load();

  final secondURL = 'https://api.edamam.com/api/food-database/v2/nutrients';

  final queryParameters2 = {
    'app_id': secret.appID,
    'app_key': secret.apiKey,
  };
  var uri2 = Uri.parse('$secondURL').replace(queryParameters: queryParameters2);

// Map variable needed for the request
  Map<String, dynamic> requestData = {
    'ingredients': [
      {
        'quantity': 1,
        'measureURI':
            'http://www.edamam.com/ontologies/edamam.owl#Measure_serving',
        'foodId': foodID,
      }
    ]
  };
// post request
  final response = await http.post(
    uri2,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(requestData),
  );
// if the request went through we will receive the statuscode 200
// we will proceed to parse the maps body
  if (response.statusCode == 200) {
    var responseData2 = jsonDecode(response.body);
    var nutrientsVar = responseData2['totalNutrients'];

// after receiving the body, we can pass the body into a variable
// then parse the information we need into the correct variables

// we had issues with the requests not being completed because the appropriate keys didn't exist and
// because of the that we had to set up a null-ware operator with the ternanry operator
// ": 0.0 " the default value gets set to 0.0 if the corresponding key doesn't exist
// example: if it didn't find "CHOLE" for cholesterol when searching through the food data then it would just automatically set it to 0.
    double calories = nutrientsVar.containsKey('ENERC_KCAL')
        ? nutrientsVar['ENERC_KCAL']['quantity']
        : 0.0;

    double fat =
        nutrientsVar.containsKey('FAT') ? nutrientsVar['FAT']['quantity'] : 0.0;

    double sugar = nutrientsVar.containsKey('SUGAR')
        ? nutrientsVar['SUGAR']['quantity']
        : 0.0;
    double protein = nutrientsVar.containsKey('PROCNT')
        ? nutrientsVar['PROCNT']['quantity']
        : 0.0;
    double carbohydrates = nutrientsVar.containsKey('CHOCDF')
        ? nutrientsVar['CHOCDF']['quantity']
        : 0.0;
    double fiber = nutrientsVar.containsKey('FIBTG')
        ? nutrientsVar['FIBTG']['quantity']
        : 0.0;
    double cholesterol = nutrientsVar.containsKey('CHOLE')
        ? nutrientsVar['CHOLE']['quantity']
        : 0.0;
    double sodium =
        nutrientsVar.containsKey('NA') ? nutrientsVar['NA']['quantity'] : 0.0;

// instance of the Food class where we pass in the data into a variable called nutritionData and then return that variable
// since we will be calling this inside the calorie tracker screen allowing us to display the List of Foods returned from the request
    var nutritionData = Food(
        foodname: foodName,
        calories: calories,
        sugar: sugar,
        fat: fat,
        protein: protein,
        carbohydrates: carbohydrates,
        fiber: fiber,
        cholesterol: cholesterol,
        sodium: sodium);

    return nutritionData;
  } else {
    print('Request failed with status: ${response.statusCode}');
    throw Exception('Failed to retrieve nutrition data for $foodName');
  }
}
