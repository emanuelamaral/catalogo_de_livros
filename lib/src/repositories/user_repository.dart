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
    final newUser = UserModel(email: email, password: password);
    final id = await database.insert('tb_usuario', newUser.toMap());
    notifyListeners();
    return id;
  }

  getUser(String email, String password) async {
    if (dbAux == null) {
      await _initRepository();
    }
    database = dbAux;
    final result = await database.query('tb_usuario',
        where: 'email = ? AND password = ?', whereArgs: [email, password]);

    if (result.isNotEmpty) {
      final user = result.first;
      return UserModel(id: user['id'] as int, email: email, password: password);
    } else {
      return;
    }
  }
}
