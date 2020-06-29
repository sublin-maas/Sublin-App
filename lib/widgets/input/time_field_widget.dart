import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:sublin/models/time.dart';

class TimeFildWidget extends StatelessWidget {
  final format = DateFormat("HH:mm");

  final Timespan timespan;
  final Function timeInputFunction;

  TimeFildWidget({
    this.timespan,
    this.timeInputFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      DateTimeField(
        format: format,
        decoration: InputDecoration(contentPadding: EdgeInsets.all(10)),
        onChanged: (time) {
          timeInputFunction(timespan, time);
        },
        onShowPicker: (context, currentValue) async {
          final time = await showTimePicker(
            context: context,
            initialTime: TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
            builder: (BuildContext context, Widget child) {
              return MediaQuery(
                data: MediaQuery.of(context)
                    .copyWith(alwaysUse24HourFormat: true),
                child: child,
              );
            },
          );
          return DateTimeField.convert(time);
        },
      ),
    ]);
  }
}