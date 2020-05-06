import 'package:collab_flutter_app/models/client_error.dart';

class ClientRequestException implements Exception {
  var _message;
  var _clientError;

  String get clientError => _clientError;

  ClientRequestException([String message = 'Try again later!', ClientError error]) {
    this._message = message;
    this._clientError = error;
  }

  @override
  String toString() {
    return _message;
  }
}
