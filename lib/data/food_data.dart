class Food {
  String foodname;
  final double calories;
  final double fat;
  final double carbohydrates;
  final double protein;
  final double cholesterol;
  final double sugar;
  final double fiber;
  final double sodium;

  Food(
      {required this.foodname,
      required this.calories,
      required this.carbohydrates,
      required this.fat,
      required this.protein,
      required this.fiber,
      required this.cholesterol,
      required this.sodium,
      required this.sugar});
}
