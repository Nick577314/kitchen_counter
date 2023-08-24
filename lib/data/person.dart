import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Person {
  late String user_id;
  late String name;
  late String age;
  late String weight;
  late String height;
  late String activitylevel;

  Person(this.user_id, this.name, this.age, this.weight, this.height,
      this.activitylevel);

  Map<String, dynamic> toMap() {
    return {
      'id': user_id,
      'name': name,
      'age': age,
      'weight': weight,
      'height': height,
      'activitylevel': activitylevel
    };
  }

  Person.fromMap(Map<String, dynamic> map) {
    user_id = map['user_id'];
    age = map['age'];
    weight = map['weight'];
    height = map['height'];
    activitylevel = map['activitylevel'];
  }
  // @override
  // String toString() {
  //   return 'Person{name: $name, age: $age, weight: $weight , height: $height, activitylevel: $activitylevel}';
  // }
}
