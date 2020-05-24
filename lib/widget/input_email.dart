import 'package:flutter/material.dart';

class InputEmail extends StatefulWidget {

  final _InputEmailState _state = _InputEmailState();

  String get value {
    return _state._email;
  }

  @override
  _InputEmailState createState() => _state;
}

class _InputEmailState extends State<InputEmail> {

  String _email;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50, left: 50, right: 50),
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width,
        child: TextField(
          onSubmitted: (val) => _email = val,
          style: TextStyle(
            color: Colors.white,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            fillColor: Colors.lightBlueAccent,
            hintText: 'Email',
            labelStyle: TextStyle(
              color: Colors.white70,
            ),
          ),
        ),
      ),
    );
  }
}