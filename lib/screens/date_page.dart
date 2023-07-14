import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:ios_android_example/constants/constants.dart';
import 'dart:io' show Platform;
import 'switch_page.dart';

class DatePage extends StatefulWidget {
  const DatePage({super.key});

  @override
  State<DatePage> createState() => _DatePageState();
}

class _DatePageState extends State<DatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Date Screen'),
      ),
      body: Container(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Date Page',
                style: mainTextStyle,
              ),
              Platform.isIOS ? IOSDatePicker() : AndroidDatePicker(),
            ],
          ),
        ),
      ),
    );
  }
}

class AndroidDatePicker extends StatelessWidget {
  const AndroidDatePicker({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DatePickerDialog(
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 7)));
  }
}

class IOSDatePicker extends StatefulWidget {
  const IOSDatePicker({super.key});

  @override
  State<IOSDatePicker> createState() => _IOSDatePickerState();
}

class _IOSDatePickerState extends State<IOSDatePicker> {
  DateTime date = DateTime.now();
  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 216,
        padding: const EdgeInsets.only(top: 6.0),
        // The Bottom margin is provided to align the popup above the system
        // navigation bar.
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        // Provide a background color for the popup.
        color: CupertinoColors.systemBackground.resolveFrom(context),
        // Use a SafeArea widget to avoid system overlaps.
        child: SafeArea(
          top: false,
          child: child,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CupertinoButton(
        // Display a CupertinoDatePicker in date picker mode.
        onPressed: () => _showDialog(
          CupertinoDatePicker(
            initialDateTime: date,
            mode: CupertinoDatePickerMode.date,
            use24hFormat: true,
            // This shows day of week alongside day of month
            showDayOfWeek: true,
            // This is called when the user changes the date.
            onDateTimeChanged: (DateTime newDate) {
              setState(() => date = newDate);
            },
          ),
        ),
        // In this example, the date is formatted manually. You can
        // use the intl package to format the value based on the
        // user's locale settings.
        child: Text(
          '${date.month}-${date.day}-${date.year}',
          style: const TextStyle(
            fontSize: 22.0,
          ),
        ),
      ),
    );
  }
}
