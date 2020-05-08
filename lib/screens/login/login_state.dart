import 'dart:ui';

import 'package:collab_flutter_app/database/user.dart';
import 'package:collab_flutter_app/listener/auth_state.dart';
import 'package:collab_flutter_app/models/logged_user.dart';
import 'package:collab_flutter_app/presenter/login_presenter.dart';
import 'package:collab_flutter_app/screens/login/login.dart';
import 'package:collab_flutter_app/screens/login/signup.dart';
import 'package:flutter/material.dart';

class LoginState extends State<LoginScreen>
    implements LoginScreenContract, AuthStateListener {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  bool _isLoading = false;
  final formKey = new GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  LoginScreenPresenter _presenter;
  String _password, _username;

  LoginState() {
    this._presenter = new LoginScreenPresenter(this);
    var authStateProvider = new AuthStateProvider();
    authStateProvider.subscribe(this);
  }

  void _submit() {
    final form = formKey.currentState;

    if (form.validate()) {
      form.save();
      setState(() {
        _isLoading = true;
        _presenter.doLogin(_username, _password);
      });
    }
  }

  void _showSnackBar(String text) {
    scaffoldKey.currentState
        .showSnackBar(new SnackBar(content: new Text(text)));
  }

  @override
  Widget build(BuildContext context) {
    final emailField = TextFormField(
      obscureText: false,
      onSaved: (val) => _username = val,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Email",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final passwordField = TextFormField(
      obscureText: true,
      onSaved: (val) => _password = val,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final loginButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.greenAccent,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          _submit();
        },
        child: Text("Login",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    final signUpForm = Container(
        child: Row(
      children: <Widget>[
        Text('Does not have account?'),
        FlatButton(
          textColor: Colors.blue,
          child: Text(
            'Sign in',
            style: TextStyle(fontSize: 20),
          ),
          onPressed: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => SignUp())),
        )
      ],
      mainAxisAlignment: MainAxisAlignment.center,
    ));

    final form = Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 45.0),
              emailField,
              SizedBox(height: 25.0),
              passwordField,
              SizedBox(
                height: 35.0,
              ),
              _isLoading
                  ? CircularProgressIndicator(
                      valueColor:
                          new AlwaysStoppedAnimation<Color>(Colors.purple))
                  : loginButton,
              SizedBox(
                height: 15.0,
              ),
            ],
          ),
        ),
        signUpForm
      ],
    );

    return Scaffold(
      key: scaffoldKey,
      body: Center(
        child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: form,
            )),
      ),
    );
  }

  @override
  void onLoginError(String errorTxt) {
    _showSnackBar(errorTxt);
    setState(() => _isLoading = false);
  }

  @override
  void onLoginSuccess(LoggedUser user) async {
    _showSnackBar(user.toString());
    setState(() => _isLoading = false);
    var db = new UserStorage();
    await db.saveUser(user);
    var authStateProvider = new AuthStateProvider();
    authStateProvider.notify(AuthState.LOGGED_IN);
  }

  @override
  void onAuthStateChanged(AuthState state) {
    _showSnackBar("Success");
  }
}
