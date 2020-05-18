import 'package:collab_flutter_app/database/logged_user.dart';
import 'package:collab_flutter_app/models/logged_user.dart';
import 'package:collab_flutter_app/models/user.dart';
import 'package:collab_flutter_app/network/http_utils.dart';
import 'package:collab_flutter_app/network/login.dart';
import 'package:collab_flutter_app/network/user.dart';

abstract class ProfileScreenContract {
  void onSuccess(User user);

  void onError(String errorTxt);
}

class ProfileScreenPresenter {
  ProfileScreenContract _view;
  UserNetwork api = new UserNetwork(NetworkUtil.instance);

  ProfileScreenPresenter(this._view);

  showProfile(String id) {
    api.get(id).then((user) {
      _view.onSuccess(user);
    }).catchError((error) => _view.onError(error.toString()));
  }
}
