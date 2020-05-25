import 'package:collab_flutter_app/presenter/sign_up_presenter.dart';
import 'package:collab_flutter_app/widget/background.dart';
import 'package:collab_flutter_app/widget/input_date.dart';
import 'package:collab_flutter_app/widget/input_email.dart';
import 'package:collab_flutter_app/widget/input_password.dart';
import 'package:collab_flutter_app/widget/input_text.dart';
import 'package:collab_flutter_app/widget/submit_button.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  SignUp({Key key, this.title}) : super(key: key);

  final String title;

  @override
  SignUpState createState() => SignUpState();
}

class SignUpState extends State<SignUp> implements SignUpScreenContract {
  final formKey = new GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  SubmitButton _signUpButton;
  SignUpScreenPresenter _presenter;

  final InputEmail inputEmail = InputEmail();
  final InputDate inputDate = InputDate();
  final InputPassword inputPassword = InputPassword();
  final InputText nameInputText =
      InputText('Name', Colors.white, Colors.blueAccent);
  final InputText phoneInputText =
      InputText('Phone', Colors.white, Colors.blueAccent);

  SignUpState() {
    this._signUpButton = SubmitButton('Sign Up', () => _submit());
    this._presenter = new SignUpScreenPresenter(this);
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
              nameInputText,
              phoneInputText,
              inputEmail,
              inputPassword,
              inputDate,
              BackButton(),
              _signUpButton,
            ],
          ),
        )
      ],
    );

    return Scaffold(
      key: scaffoldKey,
      body: BackGround(form)
    );
  }

  void _submit() {
    final form = formKey.currentState;

    if (form.validate()) {
      form.save();
      setState(() {
        _presenter.doSignUp(nameInputText.value, inputEmail.value,
            inputPassword.value, phoneInputText.value, inputDate.value);
      });
    }
  }

  @override
  void onError(String errorTxt) {
    print("some error");
    _signUpButton.reset();
  }

  @override
  void onSuccess() {
    _signUpButton.reset();
    Navigator.pop(context);
  }
}
