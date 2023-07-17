import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:ios_android_example/constants/constants.dart';
import 'dart:io' show Platform;

class SwitchPage extends StatefulWidget {
  const SwitchPage({super.key});

  @override
  State<SwitchPage> createState() => _SwitchPageState();
}

class _SwitchPageState extends State<SwitchPage> {
  bool switch1 = false;
  bool switch2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Switch Page'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Switch 1'),
              Platform.isIOS
                  ? CupertinoSwitchExample(
                      // key: UniqueKey(),
                      switchValue: switch1,
                      toggle: (bool newValue) {
                        setState(() {
                          switch1 = newValue ?? false;
                        });
                      },
                    )
                  : AndroidSwitch(
                      // key: UniqueKey(),
                      switchValue: switch1,
                      toggle: (bool newValue) {
                        setState(() {
                          switch1 = newValue ?? false;
                        });
                      },
                    ),
            ],
          ),
          SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Switch 2'),
              Platform.isIOS
                  ? CupertinoSwitchExample(
                      // key: UniqueKey(),
                      switchValue: switch2,
                      toggle: (bool newValue) {
                        setState(() {
                          switch2 = newValue ?? false;
                        });
                      },
                    )
                  : AndroidSwitch(
                      // key: UniqueKey(),
                      switchValue: switch2,
                      toggle: (bool newValue) {
                        setState(() {
                          switch2 = newValue ?? false;
                        });
                      },
                    ),
            ],
          ),
        ],
      )),
    );
  }
}

class AndroidSwitch extends StatefulWidget {
  const AndroidSwitch(
      {super.key, required this.switchValue, required this.toggle});

  final bool switchValue;
  final Function(bool value) toggle;

  @override
  State<AndroidSwitch> createState() => _AndroidSwitchState();
}

class _AndroidSwitchState extends State<AndroidSwitch> {
  @override
  Widget build(BuildContext context) {
    return Switch(
      // This bool value toggles the switch.
      value: widget.switchValue,
      activeColor: Colors.orangeAccent,
      onChanged: widget.toggle,
    );
  }
}

class CupertinoSwitchExample extends StatefulWidget {
  const CupertinoSwitchExample(
      {super.key, required this.switchValue, required this.toggle});

  final bool switchValue;
  final Function(bool value) toggle;

  @override
  State<CupertinoSwitchExample> createState() => _CupertinoSwitchExampleState();
}

class _CupertinoSwitchExampleState extends State<CupertinoSwitchExample> {
  @override
  Widget build(BuildContext context) {
    return CupertinoSwitch(
      // This bool value toggles the switch.
      value: widget.switchValue,
      activeColor: CupertinoColors.activeBlue,
      onChanged: widget.toggle,
    );
  }
}
