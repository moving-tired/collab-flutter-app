import 'package:collab_flutter_app/widget/scheme_colors.dart';
import 'package:flutter/material.dart';

class LabelText extends StatefulWidget {
  _LabelTextState _state;

  LabelText(String text) {
    _state = _LabelTextState(text: text);
  }

  @override
  _LabelTextState createState() => _state;
}

class _LabelTextState extends State<LabelText> {
  final String text;

  _LabelTextState({this.text});

  @override
  Widget build(BuildContext context) {
    final String finalText = text != null ? text : '';
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width,
      child: RichText(
        text: TextSpan(style: DefaultTextStyle.of(context).style, children: [
          TextSpan(text: finalText, style: TextStyle(color: SchemeColors.text))
        ]),
      ),
    );
  }
}
