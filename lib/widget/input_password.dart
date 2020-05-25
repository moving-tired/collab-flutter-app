import 'package:flutter/material.dart';

class InputPassword extends StatefulWidget {
  final state = _InputPasswordState();

  String get value {
    return state._password;
  }

  @override
  _InputPasswordState createState() => state;
}

class _InputPasswordState extends State<InputPassword> {
  String _password;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 50, right: 50),
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width,
        child: TextField(
          onChanged: (val) => _password = val,
          style: TextStyle(
            color: Colors.white,
          ),
          obscureText: true,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Password',
            labelStyle: TextStyle(
              color: Colors.white70,
            ),
          ),
        ),
      ),
    );
  }
}
