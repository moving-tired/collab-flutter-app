import 'dart:async';
import 'dart:convert';

import 'package:collab_flutter_app/models/user.dart';

import 'http_utils.dart';

class SignUpNetwork {
  final NetworkUtil netUtil;

  const SignUpNetwork(this.netUtil);

  static final version = "v1";
  static final apiPath = "api";
  static final baseUrl = "${NetworkUtil.BASE_URL}/$apiPath/$version";
  static final signUpUrl = "$baseUrl/users/";

  Future<User> signUp(String name, String email, String password, String phone,
      DateTime birthday) {
    return netUtil.post(signUpUrl, body: {
      "name": name,
      "email": email,
      "password": password,
      "phone": phone,
      "birthday": birthday.toIso8601String()
    }).then((res) => User.fromJson(json.decode(res.body)));
  }
}
