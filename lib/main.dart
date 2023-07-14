import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

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
          title: const Text('Flutter Demo'),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {},
        ),
        body: Column(
          children: [
            TextField(),
            Text('get this from the text field'),
            ElevatedButton(
              onPressed: () {
                print('pressed button');
              },
              child: Text(
                'button'.toUpperCase(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
