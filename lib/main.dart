import 'package:flutter/material.dart';
import 'package:ios_android_example/screens/date_page.dart';
import 'screens/text_page.dart';
import 'screens/switch_page.dart';

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
      home: TextPage(),
      routes: {
        'text': (context) => TextPage(),
        'date': (context) => DatePage(),
        'switch': (context) => SwitchPage(),
      },
    );
  }
}
