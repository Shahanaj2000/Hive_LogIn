import 'package:hive_flutter/adapters.dart';
import 'package:hive_login/db/models/data_models.dart';

class DBFunctions {
  //? Singleton constructor
  DBFunctions._internal();

  static DBFunctions instance = DBFunctions._internal(); //! Here the instance is the object

  factory DBFunctions() {
    return instance;
  }

  //! Add Users
  Future<void> userSignup(UserModel user) async {
    final db = await Hive.openBox<UserModel>('user');
    db.put(user.id, user);
  }

  //! Get Users
  Future<List<UserModel>> getUsers() async {
    final db = await Hive.openBox<UserModel>('user');
    return db.values.toList();
  }
}




