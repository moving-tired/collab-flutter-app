import 'dart:async';

import 'http_utils.dart';

class SignUpNetwork {
  final NetworkUtil netUtil;

  const SignUpNetwork(this.netUtil);

  static final version = "v1";
  static final apiPath = "api";
  static final baseUrl = "${NetworkUtil.BASE_URL}/$apiPath/$version";
  static final signUpUrl = "$baseUrl/users/";

  Future<void> signUp(String name, String email, String password, String phone,
      DateTime birthday) {
    return netUtil.post(signUpUrl, body: {
      "name": name,
      "email": email,
      "password": password,
      "phone": phone,
      "birthday": birthday.toIso8601String()
    }).then(null);
  }
}
