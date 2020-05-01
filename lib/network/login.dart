import 'dart:async';

import 'package:collab_flutter_app/models/login_user.dart';

import 'http_utils.dart';


class LoginNetwork {
  NetworkUtil _netUtil = new NetworkUtil();
  // TODO: define url by parameters
  static final BASE_URL = "http://YOUR_BACKEND_IP/login_app_backend";
  static final LOGIN_URL = BASE_URL + "/login.php";
  static final _API_KEY = "somerandomkey";

  Future<LoginUser> login(String username, String password) {
    return _netUtil.post(LOGIN_URL, body: {
      "token": _API_KEY,
      "username": username,
      "password": password
    }).then((dynamic res) {
      print(res.toString());
      if(res["error"]) throw new Exception(res["error_msg"]);
      return new LoginUser.map(res["user"]);
    });
  }
}