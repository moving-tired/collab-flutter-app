import 'package:flutter/material.dart';

class InputText extends StatefulWidget {
  _InputTextState _state;

  InputText(String label, Color color, Color textColor) {
    _state = _InputTextState(label: label, color: color, textColor: textColor);
  }

  String get value {
    return _state._text;
  }

  @override
  _InputTextState createState() => _state;
}

class _InputTextState extends State<InputText> {
  final String label;
  final Color color;
  final Color textColor;

  _InputTextState({this.label, this.color, this.textColor});

  String _text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50, left: 50, right: 50),
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width,
        child: TextField(
          onSubmitted: (val) => _text = val,
          style: TextStyle(
            color: color,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            fillColor: textColor,
            hintText: label,
            labelStyle: TextStyle(
              color: Colors.white70,
            ),
          ),
        ),
      ),
    );
  }
}
