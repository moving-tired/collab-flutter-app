import 'package:collab_flutter_app/presenter/login_presenter.dart';
import 'package:collab_flutter_app/screens/login/login_state.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  LoginState createState() => LoginState();
}
