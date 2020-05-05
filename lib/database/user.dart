import 'dart:async';
import 'dart:io' as io;

import 'package:collab_flutter_app/database/helper.dart';
import 'package:collab_flutter_app/models/logged_user.dart';

class UserStorage {

  static const String TABLE = "User";
  static final DatabaseHelper _helper = DatabaseHelper();

  Future<int> saveUser(LoggedUser user) async {
    var dbClient = await _helper.db;
    int res = await dbClient.insert(TABLE, user.toMap());
    return res;
  }

  Future<int> deleteUsers() async {
    var dbClient = await _helper.db;
    int res = await dbClient.delete(TABLE);
    return res;
  }

  Future<bool> isLoggedIn() async {
    var dbClient = await _helper.db;
    var res = await dbClient.query(TABLE);
    return res.length > 0? true: false;
  }

}