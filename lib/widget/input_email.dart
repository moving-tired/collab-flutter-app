import 'package:collab_flutter_app/widget/scheme_colors.dart';
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
          onChanged: (val) => _email = val,
          style: TextStyle(
            color: SchemeColors.text,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            fillColor: SchemeColors.hintText,
            hintText: 'Email',
          ),
        ),
      ),
    );
  }
}