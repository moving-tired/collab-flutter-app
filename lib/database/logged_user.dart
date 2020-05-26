import 'dart:async';

import 'package:collab_flutter_app/models/logged_user.dart';

class LoggedStorage {

  static const String TABLE = "UserToken";
  static LoggedUser loggedUser;

  Future<void> saveUser(LoggedUser user) async {
    loggedUser = user;
  }

  Future<void> deleteUser() async {
    loggedUser = null;
  }

  Future<bool> isLoggedIn() async {
    var loggedUser = await get();
    return loggedUser != null;
  }

  Future<LoggedUser> get() async {
    return loggedUser;
  }

}