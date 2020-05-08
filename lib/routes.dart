import 'package:collab_flutter_app/screens/login/login.dart';
import 'package:collab_flutter_app/screens/login/signup.dart';
import 'package:flutter/material.dart';

final routes = {
  '/sign-up' :          (BuildContext context) => new SignUp(),
  '/login':         (BuildContext context) => new LoginScreen(),
  '/' :          (BuildContext context) => new LoginScreen(),
};