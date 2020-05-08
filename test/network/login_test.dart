import 'dart:convert';

import 'package:collab_flutter_app/models/logged_user.dart';
import 'package:collab_flutter_app/network/http_utils.dart';
import 'package:collab_flutter_app/network/login.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';

main() {
  test("Test calling login call and return success", () async {
    var mockClient = MockClient((request) async {
      final mapJson = {'user': '123', 'token': '1234'};
      return Response(json.encode(mapJson), 200);
    });

    LoginNetwork loginClient = LoginNetwork(NetworkUtil(mockClient));
    LoggedUser user = await loginClient.login('test', '123');

    expect(user.token, '1234');
  });

  test("Test calling login call and return error", () async {
    var mockClient = MockClient((request) async {
      final mapJson = {'status': 'some_error'};
      return Response(json.encode(mapJson), 403);
    });

    LoginNetwork loginClient = LoginNetwork(NetworkUtil(mockClient));

    await loginClient
        .login('test', '123')
        .then((value) => fail("should have an error"))
        .catchError((error) => expect(error != null, true));
  });
}
