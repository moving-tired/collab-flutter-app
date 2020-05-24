import 'package:flutter/material.dart';

class BackButton extends StatefulWidget {
  _BackButtonState _state;

  BackButton(String label) {
    _state = _BackButtonState(label: label);
  }

  @override
  _BackButtonState createState() => _state;
}

class _BackButtonState extends State<BackButton> {
  final String label;

  _BackButtonState({this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50, left: 50, right: 50),
      child: Container(
        height: 60,
        width: MediaQuery
            .of(context)
            .size
            .width,
        child: Material(
          child: MaterialButton(
            minWidth: MediaQuery
                .of(context)
                .size
                .width,
            onPressed: () => Navigator.pop(context),
            child: Text(label,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
