import 'package:collab_flutter_app/widget/scheme_colors.dart';
import 'package:flutter/material.dart';

class Background extends StatefulWidget {
  _BackgroundState _state;

  Background(Column column) {
    _state = _BackgroundState(column: column);
  }

  @override
  _BackgroundState createState() => _state;
}

class _BackgroundState extends State<Background> {
  final Column column;

  _BackgroundState({this.column});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [SchemeColors.firstColor, SchemeColors.endColor]),
          ),
          child: column),
    );
  }
}
