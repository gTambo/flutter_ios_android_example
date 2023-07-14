import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:ios_android_example/constants/constants.dart';
import 'dart:io' show Platform;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.cyanAccent,
        // scaffoldBackgroundColor: Colors.white,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Flutter Demo',
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {},
        ),
        body: BodyWidget(),
      ),
    );
  }
}

class BodyWidget extends StatefulWidget {
  const BodyWidget({
    super.key,
  });

  @override
  State<BodyWidget> createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<BodyWidget> {
  String inputText = '';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text(
              'Enter text below.',
              style: mainTextStyle,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Platform.isIOS
              ? IOSTextField((String newText) {
                  setState(() {
                    inputText = newText;
                  });
                })
              : AndroidTextField((String newText) {
                  setState(() {
                    inputText = newText;
                  });
                }),
          const SizedBox(
            height: 15,
          ),
          Text(
            'You entered: $inputText',
            style: mainTextStyle,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 15,
          ),
          Platform.isIOS ? const IOSButton() : const AndroidElevatedButton()
        ],
      ),
    );
  }
}

class AndroidTextField extends StatelessWidget {
  AndroidTextField(this.setText);

  final Function(String newText) setText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: TextAlign.center,
      onChanged: (newText) {
        setText(newText);
      },
    );
  }
}

class IOSTextField extends StatelessWidget {
  IOSTextField(this.setText);

  final Function(String newText) setText;

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: Colors.white,
      ),
      onChanged: (newText) {
        setText(newText);
      },
    );
  }
}

class AndroidElevatedButton extends StatelessWidget {
  const AndroidElevatedButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // TODO replace with navigation
        print('pressed material button');
      },
      child: Text(
        'next'.toUpperCase(),
      ),
    );
  }
}

class IOSButton extends StatelessWidget {
  const IOSButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton.filled(
      // color: Colors.white,
      onPressed: () {
        // TODO replace with navigation
        print('pressed iOS button');
      },
      child: const Text(
        'NEXT',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          // color: Colors.blue,
        ),
      ),
    );
  }
}
