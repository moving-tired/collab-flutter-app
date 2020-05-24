import 'package:flutter/material.dart';

class TextButton extends StatefulWidget {
  _TextButtonState _state;

  TextButton(String label, Function submit) {
    _state = _TextButtonState(label: label, submit: submit);
  }

  @override
  _TextButtonState createState() => _state;
}

class _TextButtonState extends State<TextButton> {
  final String label;
  final Function submit;

  _TextButtonState({this.label, this.submit});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text(
        label,
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () => submit.call(),
    );

  }
}
