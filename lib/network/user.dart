import 'dart:async';
import 'dart:convert';
import 'package:collab_flutter_app/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:collab_flutter_app/models/logged_user.dart';

import 'http_utils.dart';

class UserNetwork {
  final NetworkUtil netUtil;

  const UserNetwork(this.netUtil);

  static final version = "v1";
  static final apiPath = "api";
  static final baseUrl = "${NetworkUtil.BASE_URL}/$apiPath/$version";
  static final getUserUrl = "$baseUrl/users";

  Future<User> get(String id) {
    return netUtil
        .get("$getUserUrl/$id")
        .then((res) => User.fromJson(json.decode(res.body)));
  }
}
