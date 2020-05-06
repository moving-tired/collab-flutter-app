class LoggedUser {
  final String id;
  final String username;
  final String name;
  final String jwt;

  LoggedUser({this.id, this.username, this.name, this.jwt});

  factory LoggedUser.fromJson(Map<String, dynamic> json) {
    return LoggedUser(
      id: json['id'],
      username: json['username'],
      name: json['name'],
      jwt: json['jwt'],
    );
  }

  Map<String, String> toMap() {
    return {id: id, username: username, name: name, jwt: jwt};
  }
}
