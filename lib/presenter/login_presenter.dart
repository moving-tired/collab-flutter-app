import 'package:collab_flutter_app/models/logged_user.dart';
import 'package:collab_flutter_app/network/login.dart';

abstract class LoginScreenContract {
  void onLoginSuccess(LoggedUser user);

  void onLoginError(String errorTxt);
}

class LoginScreenPresenter {
  LoginScreenContract _view;
  LoginNetwork api = new LoginNetwork();

  LoginScreenPresenter(this._view);

  doLogin(String username, String password) {
    api.login(username, password).then((user) {
      _view.onLoginSuccess(user);
    }).catchError((error) => _view.onLoginError(error.toString()));
  }
}
