import 'package:collab_flutter_app/models/logged_user.dart';
import 'package:collab_flutter_app/presenter/login_presenter.dart';
import 'package:collab_flutter_app/screens/home/home.dart';
import 'package:collab_flutter_app/screens/login/signup.dart';
import 'package:collab_flutter_app/widget/background.dart';
import 'package:collab_flutter_app/widget/input_email.dart';
import 'package:collab_flutter_app/widget/input_password.dart';
import 'package:collab_flutter_app/widget/submit_button.dart';
import 'package:collab_flutter_app/widget/text_button.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<LoginScreen> implements LoginScreenContract {
  final formKey = new GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  LoginScreenPresenter _presenter;
  SubmitButton _logInButton;
  TextButton _signUpButton;
  final InputEmail inputEmail = InputEmail();
  final InputPassword inputPassword = InputPassword();

  LoginState() {
    this._signUpButton = TextButton(
        'Does not have account?',
        () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => SignUp())));
    this._logInButton = SubmitButton('Log In', () => _submit());
    this._presenter = new LoginScreenPresenter(this);
  }

  void _submit() {
    final form = formKey.currentState;

    if (form.validate()) {
      form.save();
      setState(() {
        _presenter.doLogin(inputEmail.value, inputPassword.value);
      });
    }
  }

  void _showSnackBar(String text) {
    scaffoldKey.currentState
        .showSnackBar(new SnackBar(content: new Text(text)));
  }

  @override
  Widget build(BuildContext context) {
    final form = Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              inputEmail,
              inputPassword,
              _logInButton,
              _signUpButton,
            ],
          ),
        ),
      ],
    );

    return Scaffold(key: scaffoldKey, body: BackGround(form));
  }

  @override
  void onLoginError(String errorTxt) {
    _showSnackBar(errorTxt);
    _logInButton.reset();
  }

  @override
  void onLoginSuccess(LoggedUser user) async {
    _showSnackBar(user.name);
    _logInButton.reset();
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomeScreen()));
  }
}
