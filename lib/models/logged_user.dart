class LoggedUser {
  final String user;
  final String token;

  LoggedUser({this.user, this.token});

  factory LoggedUser.fromJson(Map<String, dynamic> json) {
    return LoggedUser(
      user: json['user'],
      token: json['token'],
    );
  }

  Map<String, String> toMap() {
    return { user: user, token: token};
  }
}
