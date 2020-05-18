class LoggedUser {
  final String name;
  final String token;
  final String id;

  LoggedUser({this.name, this.token, this.id});

  factory LoggedUser.fromJson(Map<String, dynamic> json) {
    return LoggedUser(
      name: json['data']['name'],
      id: json['data']['id'].toString(),
      token: json['data']['token'],
    );
  }

  Map<String, String> toMap() {
    return { name: name, token: token, id: id};
  }
}
