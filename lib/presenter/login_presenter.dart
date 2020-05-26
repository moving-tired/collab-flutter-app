import 'package:collab_flutter_app/database/logged_user.dart';
import 'package:collab_flutter_app/models/logged_user.dart';
import 'package:collab_flutter_app/network/http_utils.dart';
import 'package:collab_flutter_app/network/login.dart';

abstract class LoginScreenContract {
  void onLoginSuccess(LoggedUser user);

  void onLoginError(String errorTxt);
}

class LoginScreenPresenter {
  LoginScreenContract _view;
  LoginNetwork api = new LoginNetwork(NetworkUtil.instance);
  LoggedStorage _storage = new LoggedStorage();

  LoginScreenPresenter(this._view);

  doLogin(String username, String password) {
    api.login(username, password).then((user) {
      _storage
          .saveUser(user)
          .whenComplete(() => _view.onLoginSuccess(user))
          .catchError((error) => _view.onLoginError(error.toString()));
    }).catchError((error) => _view.onLoginError(error.toString()));
  }

  checkLogged() {
    _storage.get().then((user) {
      if (user != null) {
        _view.onLoginSuccess(user);
      }
      print('user not logged yet');
    }).catchError((onError) => print('user not logged yet'));
  }
}
