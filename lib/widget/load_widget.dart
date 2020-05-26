import 'package:collab_flutter_app/widget/scheme_colors.dart';
import 'package:flutter/material.dart';

abstract class LoadWidgetState<T extends StatefulWidget> extends State<T> {
  bool isLoading = false;

  LoadWidgetState();

  void resetState() {
    setState(() {
      isLoading = false;
    });
  }

  void load() {
    setState(() {
      isLoading = true;
    });
    performLoad();
  }

  void performLoad();

  void unload();

  Widget defaultWidget();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        child: isLoading
            ? CircularProgressIndicator(
                valueColor:
                    new AlwaysStoppedAnimation<Color>(SchemeColors.endColor))
            : defaultWidget());
  }
}
