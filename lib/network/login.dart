import 'dart:async';
import 'dart:io';

import 'package:collab_flutter_app/models/logged_user.dart';
import 'package:collab_flutter_app/models/login_user.dart';

import 'http_utils.dart';

class LoginNetwork {
  NetworkUtil _netUtil = new NetworkUtil();

  static final version = "v1";
  static final apiPath = "api";
  static final baseUrl = "${NetworkUtil.BASE_URL}/$apiPath/$version";
  static final loginUrl = "$baseUrl/user/sign_in";

  Future<LoggedUser> login(String email, String password) async {
    return _netUtil.post(loginUrl,
        body: {"email": email, "password": password}).then((dynamic res) {
      if (res["status"]) throw new Exception(res["status"]);
      return new LoggedUser(
          res["id"], res["username"], res["name"], res["jwt"]);
    });
  }
}
