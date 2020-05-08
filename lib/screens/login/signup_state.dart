import 'dart:ui';

import 'package:collab_flutter_app/screens/login/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class SignUpState extends State<SignUp> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  bool _isLoading = false;
  final formKey = new GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  String _password, _email, _phone;
  DateTime _birthday;

  SignUpState() {}

  void _submit() {
    final form = formKey.currentState;

    if (form.validate()) {
      form.save();
      setState(() {
        _isLoading = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final birthdayField = FlatButton(
        onPressed: () {
          DatePicker.showDatePicker(context,
              showTitleActions: true,
              minTime: DateTime(1900, 1, 1),
              maxTime: DateTime.now(),
              onConfirm: (date) => _birthday = date,
              currentTime: DateTime.now(),
              locale: LocaleType.es);
        },
        child: Text(
          'Select birthday',
          style: style,
          textAlign: TextAlign.center,
        ));
    final phoneField = TextFormField(
      obscureText: false,
      onSaved: (val) => _phone = val,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Phone",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final emailField = TextFormField(
      obscureText: false,
      onSaved: (val) => _email = val,
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
    final cancelButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.lime,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () => Navigator.pop(context),
        child: Text("Back",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
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
        child: Text("Sign Up",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    final form = Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 35.0),
              phoneField,
              SizedBox(height: 35.0),
              emailField,
              SizedBox(height: 35.0),
              passwordField,
              SizedBox(height: 35.0),
              birthdayField,
              SizedBox(height: 25.0),
              cancelButton,
              SizedBox(height: 35.0),
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
        )
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
}
