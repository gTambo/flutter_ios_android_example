import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:ios_android_example/constants/constants.dart';
import 'package:ios_android_example/platform_widgets/android/elevated_button.dart';
import 'package:ios_android_example/platform_widgets/iOS/button.dart';
import 'dart:io' show Platform;
import 'switch_page.dart';

class DatePage extends StatefulWidget {
  const DatePage({super.key});

  @override
  State<DatePage> createState() => _DatePageState();
}

class _DatePageState extends State<DatePage> {
  DateTime date = DateTime.now();
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
              Platform.isIOS
                  ? IOSDatePicker(
                      date: date,
                      onChanged: (value) {
                        setState(() {
                          date = value;
                        });
                      },
                    )
                  : _AndroidDatePicker(
                      date: date,
                      onChanged: (value) {
                        setState(() {
                          date = value;
                        });
                      },
                    ),
              Platform.isIOS
                  ? IOSButton(
                      onPressed: () => nextPage(context, const SwitchPage()),
                      label: 'next')
                  : AndroidElevatedButton(
                      onPressed: () => nextPage(context, const SwitchPage()),
                      label: 'next')
            ],
          ),
        ),
      ),
    );
  }
}

// class AndroidDatePicker extends StatelessWidget {
//   const AndroidDatePicker({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return DatePickerDialog(
//         initialDate: DateTime.now(),
//         firstDate: DateTime.now(),
//         lastDate: DateTime.now().add(Duration(days: 7)));
//   }
// }

class IOSDatePicker extends StatefulWidget {
  const IOSDatePicker({super.key, required this.date, required this.onChanged});

  final DateTime date;
  final ValueChanged<DateTime> onChanged;

  @override
  State<IOSDatePicker> createState() => _IOSDatePickerState();
}

class _IOSDatePickerState extends State<IOSDatePicker> {
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
            initialDateTime: widget.date,
            mode: CupertinoDatePickerMode.date,
            use24hFormat: true,
            // This shows day of week alongside day of month
            showDayOfWeek: true,
            // This is called when the user changes the date.
            onDateTimeChanged: (DateTime newDate) {
              widget.onChanged(newDate);
            },
          ),
        ),
        // In this example, the date is formatted manually. You can
        // use the intl package to format the value based on the
        // user's locale settings.
        child: Text(
          '${widget.date.month}-${widget.date.day}-${widget.date.year}',
          style: const TextStyle(
            fontSize: 22.0,
          ),
        ),
      ),
    );
  }
}

class _AndroidDatePicker extends StatefulWidget {
  final DateTime date;
  final ValueChanged<DateTime> onChanged;

  const _AndroidDatePicker({
    required this.date,
    required this.onChanged,
  });

  @override
  State<_AndroidDatePicker> createState() => _AndroidDatePickerState();
}

class _AndroidDatePickerState extends State<_AndroidDatePicker> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: OutlinedButton(
        child: Text(
          '${widget.date.month}/${widget.date.day}/${widget.date.year}',
          style: const TextStyle(fontSize: 30),
        ),
        onPressed: () async {
          var newDate = await showDatePicker(
            context: context,
            initialDate: widget.date,
            firstDate: DateTime(1900),
            lastDate: DateTime(2100),
          );

          // Don't change the date if the date picker returns null.
          if (newDate == null) {
            return;
          }

          widget.onChanged(newDate);
        },
      ),
    );
  }
}
