class User {
  final String email;
  final String id;
  final String name;
  final String phone;

  User({this.email, this.id, this.name, this.phone});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['data']['email'],
      name: json['data']['name'],
      id: json['data']['id'].toString(),
      phone: json['data']['phone'],
    );
  }

  Map<String, String> toMap() {
    return {name: name, email: email, phone: phone, id: id};
  }
}
