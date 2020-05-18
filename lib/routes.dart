import 'package:collab_flutter_app/screens/home/home.dart';
import 'package:collab_flutter_app/screens/login/login.dart';
import 'package:collab_flutter_app/screens/login/signup.dart';
import 'package:collab_flutter_app/screens/profile/profile.dart';
import 'package:flutter/material.dart';

final routes = {
  '/profile' :          (BuildContext context) => new ProfileScreen(),
  '/home' :          (BuildContext context) => new HomeScreen(),
  '/sign-up' :          (BuildContext context) => new SignUp(),
  '/login':         (BuildContext context) => new LoginScreen(),
  '/' :          (BuildContext context) => new LoginScreen(),
};