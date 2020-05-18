import 'package:collab_flutter_app/screens/home/home_state.dart';
import 'package:collab_flutter_app/screens/login/login_state.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  HomeState createState() => HomeState();
}
