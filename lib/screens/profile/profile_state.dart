import 'package:collab_flutter_app/database/logged_user.dart';
import 'package:collab_flutter_app/models/logged_user.dart';
import 'package:collab_flutter_app/models/user.dart';
import 'package:collab_flutter_app/presenter/profile_presenter.dart';
import 'package:collab_flutter_app/screens/profile/profile.dart';
import 'package:collab_flutter_app/widget/background.dart';
import 'package:collab_flutter_app/widget/scheme_colors.dart';
import 'package:collab_flutter_app/widget/text_label.dart';
import 'package:flutter/material.dart';

class ProfileState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin, ProfileScreenContract {
  ProfileScreenPresenter _presenter;

  String _name, _email, _phone;

  ProfileState() {
    _presenter = ProfileScreenPresenter(this);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => load());
  }

  @override
  Widget build(BuildContext context) {
    if (_name == null) {
      return Container();
    }

    return Scaffold(
      body: Background(
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Form(
              child: Column(
                children: <Widget>[
                  LabelText(_name),
                  LabelText(_email),
                  LabelText(_phone),
                ],
              ),
            )
          ],
        ),
      ),
    );
//    return Scaffold(
//      body: Container(
//        child: Column(
//          children: <Widget>[
//            Container(
//              child: Padding(
//                padding: EdgeInsets.only(top: 20.0),
//                child: new Stack(
//                  fit: StackFit.loose,
//                  children: <Widget>[
//                    new Row(
//                      crossAxisAlignment: CrossAxisAlignment.center,
//                      mainAxisAlignment: MainAxisAlignment.center,
//                      children: <Widget>[
//                        new Container(
//                            width: 140.0,
//                            height: 140.0,
//                            decoration: new BoxDecoration(
//                              shape: BoxShape.circle,
//                              image: new DecorationImage(
//                                image:
//                                    new ExactAssetImage('assets/images/as.png'),
//                                fit: BoxFit.cover,
//                              ),
//                            )),
//                      ],
//                    ),
//                    Padding(
//                        padding: EdgeInsets.only(top: 90.0, right: 100.0),
//                        child: new Row(
//                          mainAxisAlignment: MainAxisAlignment.center,
//                          children: <Widget>[
//                            new CircleAvatar(
//                              backgroundColor: Colors.red,
//                              radius: 25.0,
//                              child: new Icon(
//                                Icons.camera_alt,
//                                color: Colors.white,
//                              ),
//                            )
//                          ],
//                        )),
//                  ],
//                ),
//              ),
//            ),
//            Container(
//              color: Color(0xffFFFFFF),
//              child: Padding(
//                padding: EdgeInsets.only(bottom: 25.0),
//                child: new Column(
//                  crossAxisAlignment: CrossAxisAlignment.start,
//                  mainAxisAlignment: MainAxisAlignment.start,
//                  children: <Widget>[
//                    Padding(
//                      padding:
//                          EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
//                      child: new Row(
//                        mainAxisSize: MainAxisSize.max,
//                        children: <Widget>[
//                          new Column(
//                            mainAxisAlignment: MainAxisAlignment.start,
//                            mainAxisSize: MainAxisSize.min,
//                            children: <Widget>[
//                              new Text(
//                                'Name',
//                                style: TextStyle(
//                                    fontSize: 16.0,
//                                    fontWeight: FontWeight.bold),
//                              ),
//                            ],
//                          ),
//                        ],
//                      ),
//                    ),
//                    Padding(
//                      padding:
//                          EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
//                      child: new Row(
//                        mainAxisSize: MainAxisSize.max,
//                        children: <Widget>[
//                          new Column(
//                            mainAxisAlignment: MainAxisAlignment.start,
//                            mainAxisSize: MainAxisSize.min,
//                            children: <Widget>[
//                              new Text(
//                                _user != null ? _user.name : '',
//                                style: TextStyle(
//                                    fontSize: 16.0,
//                                    fontWeight: FontWeight.bold),
//                              ),
//                            ],
//                          ),
//                        ],
//                      ),
//                    ),
//                  ],
//                ),
//              ),
//            )
//          ],
//        ),
//      ),
//    );
  }

  load() {
    LoggedStorage _storage = new LoggedStorage();
    _storage.get().then((value) => _presenter.showProfile(value.id));
  }

  @override
  void onError(String errorTxt) {
    print(errorTxt);
  }

  @override
  void onSuccess(User user) {
    setState(() {
      _phone = user.phone;
      _email = user.email;
      _name = user.name;
    });
  }
}
