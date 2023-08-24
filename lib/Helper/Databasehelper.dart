import 'dart:async';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:kitchen_counter/data/user.dart';
import 'package:kitchen_counter/data/person.dart';
import 'package:path/path.dart';
import 'dart:io' as io;

class DatabaseHelper {
  Database? _database;

  static const String DB_Name = 'kitchen_counter.db';
  static const String Table_User = 'user';
  static const String Person_Profile = 'person';
  static const int Version = 1;
  static const String C_UserID = "user_id";
  static const String C_UserName = "user_name";
  static const String C_Email = "email";
  static const String C_Password = "password";
  static const String C_Name = "name";
  static const String C_Weight = "weight";
  static const String C_Height = "height";
  static const String C_Activitylevel = "activity_level";

  Future<Database?> get db async {
    if (_database != null) {
      return _database;
    }
    _database = await initOb();
    return _database;
  }

  initOb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, DB_Name);
    var db = await openDatabase(path, version: Version, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int intVersion) async {
    await db.execute("CREATE TABLE $Table_User ("
        " $C_UserID TEXT PRIMARY KEY, "
        " $C_UserName TEXT, "
        " $C_Email TEXT, "
        " $C_Password TEXT"
        ")");
    await db.execute("CREATE TABLE $Person_Profile ("
        "$C_UserID TEXT PRIMARY KEY, "
        "$C_Name TEXT, "
        "$C_Weight TEXT, "
        "$C_Height TEXT, "
        "$C_Activitylevel TEXT, "
        "FOREIGN KEY ($C_UserID) REFERENCES $Table_User($C_UserID)"
        ")");
  }

  Future<int?> saveUserData(User user) async {
    var dbClient = await db;
    var res = await dbClient?.insert(Table_User, user.toMap());
    return res;
  }

  Future<int?> savePersonData(User user) async {
    var dbClient = await db;
    var res = await dbClient?.insert(Person_Profile, user.toMap());
    //var res2 = await dbClient.insert(Person_profile, values)
    return res;
  }

  Future<Person?> getPersonData(String userId, String name) async {
    var dbClient = await db;
    var res = await dbClient?.rawQuery("SELECT * FROM $Person_Profile WHERE "
        "$C_UserID = '$userId' AND "
        "$C_Name = '$name' AND");

    if (res!.isEmpty) {
      return Person.fromMap(res.first);
    }
    return null;
  }

  Future<User?> getLoginData(String userId, String password) async {
    var dbClient = await db;
    var res = await dbClient?.rawQuery("SELECT * FROM $Table_User WHERE "
        "$C_UserID = '$userId' AND "
        "$C_Password = '$password' ");

    if (res!.isEmpty) {
      return User.fromMap(res.first);
    }
    return null;
  }

  Future<List<User>> getAllUser() async {
    var dbClient = await db;
    var res = await dbClient?.query("user");
    List<User> list = (res!.isNotEmpty
        ? res.map((c) => User.fromMap(c)).toList()
        : null) as List<User>;
    return list;
  }

  Future<List<Person>> getAllPeople() async {
    var dbClient = await db;
    var res = await dbClient?.query("person");
    List<Person> list = (res!.isNotEmpty
        ? res.map((c) => Person.fromMap(c)).toList()
        : null) as List<Person>;
    return list;
  }
}

  // https://docs.flutter.dev/cookbook/persistence/sqlite

  // Future<void> insertPerson(Person person) async {
  //   // Get a reference to the database.
  //   final db = await database;

  //   // Insert the Dog into the correct table. You might also specify the
  //   // `conflictAlgorithm` to use in case the same dog is inserted twice.
  //   //
  //   // In this case, replace any previous data.
  //   await db.insert(
  //     'person',
  //     person.toMap(),
  //     conflictAlgorithm: ConflictAlgorithm.replace,
  //   );
  // }

  // Future<void> updatePerson(Person person) async {
  //   // Get a reference to the database.
  //   final db = await database;

  //   // Update the given Person.
  //   await db.update(
  //     'person',
  //     person.toMap(),
  //     // Ensure that the Person has a matching id.
  //     where: 'id = ?',
  //     // Pass the Person's id as a whereArg to prevent SQL injection.
  //     whereArgs: [person.id],
  //   );
  // }

  // Future<void> deletePerson(int id) async {
  //   // Get a reference to the database.
  //   final db = await database;

  //   // Remove the Person from the database.
  //   await db.delete(
  //     'Person',
  //     // Use a `where` clause to delete a specific dog.
  //     where: 'id = ?',
  //     // Pass the Person's id as a whereArg to prevent SQL injection.
  //     whereArgs: [id],
  //   );
  // }

