import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:ios_android_example/platform_widgets/android/elevated_button.dart';
import 'package:ios_android_example/platform_widgets/iOS/button.dart';
import 'package:ios_android_example/constants/constants.dart';
import 'dart:io' show Platform;
import 'date_page.dart';

class TextPage extends StatefulWidget {
  const TextPage({
    super.key,
  });

  @override
  State<TextPage> createState() => _TextPageState();
}

class _TextPageState extends State<TextPage> {
  String inputText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Flutter Demo',
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
      body: Padding(
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
            Platform.isIOS
                ? IOSButton(
                    label: 'NEXT',
                    onPressed: () {
                      nextPage(context, const DatePage());
                    },
                  )
                : AndroidElevatedButton(
                    label: 'next',
                    onPressed: () {
                      nextPage(context, const DatePage());
                    },
                  ),
          ],
        ),
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
