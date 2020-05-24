import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class InputDate extends StatefulWidget {
  final _InputDateState _state = _InputDateState();

  DateTime get value {
    return _state._birthday;
  }

  @override
  _InputDateState createState() => _state;
}

class _InputDateState extends State<InputDate> {
  DateTime _birthday = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50, left: 50, right: 50),
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width,
        child: FlatButton(
          onPressed: () {
            DatePicker.showDatePicker(context,
                showTitleActions: true,
                minTime: DateTime(1900, 1, 1),
                maxTime: DateTime.now(),
                onConfirm: (date) => _birthday = date,
                currentTime: DateTime.now(),
                locale: LocaleType.es);
          },
          child: Text(
            'Select birthday',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
