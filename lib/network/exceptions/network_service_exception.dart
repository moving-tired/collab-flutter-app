class NetworkServerException implements Exception {
  var _message;

  NetworkServerException([String message = 'Server Error. Try again later!']) {
    this._message = message;
  }

  @override
  String toString() {
    return _message;
  }
}