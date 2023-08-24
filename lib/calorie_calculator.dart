double bmrcalc(
  int height,
  int weight,
  int age,
  String sex,
) {
  double BMR;

  if (sex == "Female") {
    BMR = 655.1 + (9.563 * weight) + (1.850 * height) - (4.676 * age);
  } else {
    BMR = 66.5 + (13.75 * weight) + (5.003 * height) - (6.75 * age);
  }

  return BMR;
}

double tdeecalc(String activityLevel, double BMR) {
  double TDEE = 0;

  switch (activityLevel) {
    case "Sedentary":
      {
        TDEE = BMR * 1.2;
      }
      break;
    case "Lightly Active":
      {
        TDEE = BMR * 1.375;
      }
      break;
    case "Moderately Active":
      {
        TDEE = BMR * 1.55;
      }
      break;
    case "Very Active":
      {
        TDEE = BMR * 1.725;
      }
      break;
    case "Extra Active":
      {
        TDEE = BMR * 1.9;
      }

      break;
    default:
  }
  return TDEE;
}


// Moderately active (3-5 days of exercise per week): BMR x 1.55
// Very active (6-7 days of exercise per week): BMR x 1.725
// Extra active (very intense exercise or physical job): BMR x 1.9
// if goal is to lose weight use one formula
// if goal is to gain weight use other formula
// if goal is to maintain weight
// each formula should return how many calories they should eat
// Harris-Benedict formula to calculate someones Basal Metabolic Rate to lose weight
// for women
// BMR = 655.1 + (9.563 × weight in kg) + (1.850 × height in cm) - (4.676 × age)
// for men
// BMR = 66.5 + (13.75 × weight in kg) + (5.003 × height in cm) - (6.75 × age)

