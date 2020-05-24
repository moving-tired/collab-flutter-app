import 'package:flutter/material.dart';

abstract class AbstractRootWidget<T extends StatefulWidget> extends State<T> {

  bool _isLoading = false;
  final scaffoldKey = new GlobalKey<ScaffoldState>();

  void showSnack(String text) {
    scaffoldKey.currentState
        .showSnackBar(new SnackBar(content: new Text(text)));
  }
//
//  showLoad() {
//    setState(() {
//      _isLoading
//      ? CircularProgressIndicator(
//          valueColor:
//          new AlwaysStoppedAnimation<Color>(Colors.purple))
//    });
//  }

}