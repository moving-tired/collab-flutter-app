import 'package:collab_flutter_app/network/http_utils.dart';
import 'package:collab_flutter_app/network/sign_up.dart';

abstract class SignUpScreenContract {
  void onSuccess();

  void onError(String errorTxt);
}

class SignUpScreenPresenter {
  SignUpScreenContract _view;
  SignUpNetwork api = new SignUpNetwork(NetworkUtil.instance);

  SignUpScreenPresenter(this._view);

  doSignUp(String name, String email, String password, String phone, DateTime birthday) {
    api.signUp(name, email, password, phone, birthday).then((user) {
      _view.onSuccess();
    }).catchError((error) => _view.onError(error.toString()));
  }
}
