class LoggedUser {
  final String name;
  final String token;

  LoggedUser({this.name, this.token});

  factory LoggedUser.fromJson(Map<String, dynamic> json) {
    return LoggedUser(
      name: json['data.name'],
      token: json['data.token'],
    );
  }

  Map<String, String> toMap() {
    return { name: name, token: token};
  }
}
