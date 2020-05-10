import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:collab_flutter_app/models/logged_user.dart';

import 'http_utils.dart';

class LoginNetwork {
  final NetworkUtil netUtil;

  const LoginNetwork(this.netUtil);

  static final version = "v1";
  static final apiPath = "api";
  static final baseUrl = "${NetworkUtil.BASE_URL}/$apiPath/$version";
  static final loginUrl = "$baseUrl/users/sign_in";

  Future<LoggedUser> login(String email, String password) {
    return netUtil
        .post(loginUrl, body: {"email": email, "password": password})
        .then((res) => LoggedUser.fromJson(json.decode(res.body)));
  }
}
