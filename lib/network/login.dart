import 'dart:async';
import 'dart:convert';

import 'package:collab_flutter_app/models/logged_user.dart';

import 'http_utils.dart';

class LoginNetwork {
  NetworkUtil _netUtil = new NetworkUtil();

  static final version = "v1";
  static final apiPath = "api";
  static final baseUrl = "${NetworkUtil.BASE_URL}/$apiPath/$version";
  static final loginUrl = "$baseUrl/user/sign_in";

  Future<LoggedUser> login(String email, String password) {
    return _netUtil
        .post(loginUrl, body: {"email": email, "password": password})
        .then((res) => LoggedUser.fromJson(json.decode(res.body)));
  }
}
