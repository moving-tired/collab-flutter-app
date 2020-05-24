import 'package:collab_flutter_app/widget/load_widget.dart';
import 'package:flutter/material.dart';

class SubmitButton extends StatefulWidget {
  _SubmitButtonState _state;

  SubmitButton(String label, Function submit) {
    _state = _SubmitButtonState(label: label, submit: submit);
  }

  void reset() {
    _state.resetState();
  }

  @override
  _SubmitButtonState createState() => _state;
}

class _SubmitButtonState extends LoadWidgetState<SubmitButton> {
  final String label;
  final Function submit;

  _SubmitButtonState({this.label, this.submit});

  @override
  Widget defaultWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () => load(),
        padding: EdgeInsets.all(12),
        color: Colors.lightBlueAccent,
        child: Text(label, style: TextStyle(color: Colors.white)),
      ),
    );
  }

  @override
  void performLoad() {
    submit.call();
  }

  @override
  void unload() {
    resetState();
  }
}
