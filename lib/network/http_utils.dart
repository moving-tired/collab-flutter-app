import 'dart:async';
import 'dart:convert';
import 'package:collab_flutter_app/models/client_error.dart';
import 'package:collab_flutter_app/network/exceptions/client_request_exception.dart';
import 'package:collab_flutter_app/network/exceptions/network_service_exception.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class NetworkUtil {
  static const String BASE_URL = "http://localhost:4000";
  static NetworkUtil _instance = new NetworkUtil.internal();

  NetworkUtil.internal();

  factory NetworkUtil() => _instance;

  Future<Response> get(String url) {
    return http.get(url).then((response) => parseResponse(response));
  }

  Future<Response> post(String url, {Map headers, body, encoding}) {
    return http
        .post(url, body: body, headers: headers, encoding: encoding)
        .then((response) => parseResponse(response));
  }

  http.Response parseResponse(http.Response response) {
    final int statusCode = response.statusCode;

    if (statusCode < 200 || statusCode >= 500 || response.body == null) {
      throw new NetworkServerException();
    } else if (statusCode > 400) {
      final clientError = ClientError.fromJson(json.decode(response.body));
      throw new ClientRequestException("Response not expected", clientError);
    }

    return response;
  }
}
