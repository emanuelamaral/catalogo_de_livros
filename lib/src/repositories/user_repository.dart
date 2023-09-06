import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';

import '../database/db.dart';
import '../models/user.dart';

class UserRepository extends ChangeNotifier {
  late Database database;
  dynamic dbAux;

  UserRepository() {
    _initRepository();
  }

  _initRepository() async {
    dbAux = await DB.instance.database;
  }

  Future<int> addUser(String email, String password) async {
    if (dbAux == null) {
      await _initRepository();
    }
    database = dbAux;
    final newUser = UserModel(
        id: Random().nextInt(100) + 1, email: email, password: password);
    final id = await database.insert('tb_usuario', newUser.toMap());
    notifyListeners();
    return id;
  }
}
