class ClientError {
  final String status;
  final String error;

  ClientError({this.status, this.error});

  factory ClientError.fromJson(Map<String, dynamic> json) {
    return ClientError(status: json['status'], error: json['error']);
  }

  Map<String, String> toMap() {
    return {status: status, error: error};
  }
}
