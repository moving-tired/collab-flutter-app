import 'package:flutter/material.dart';

class BackGround extends StatefulWidget {
  _BackGroundState _state;

  BackGround(Column column) {
    _state = _BackGroundState(column: column);
  }

  @override
  _BackGroundState createState() => _state;
}

class _BackGroundState extends State<BackGround> {
  final Column column;

  _BackGroundState({this.column});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.blueGrey, Colors.lightBlueAccent]),
          ),
          child: column),
    );
  }
}
