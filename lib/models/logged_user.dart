class LoggedUser {
  String _id;
  String _username;
  String _name;
  String _jwt;
  LoggedUser(this._id, this._username, this._name, this._jwt);

  String get id => _id;
  String get username => _username;
  String get name => _name;
  String get jwt => _jwt;

  Map<String, String> toMap() {
    return { id: id, username: username, name: name, jwt: jwt };
  }
}