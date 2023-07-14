import 'package:flutter/material.dart';

const mainTextStyle = TextStyle(fontSize: 20, color: Colors.cyanAccent);

void nextPage(BuildContext context, Widget route) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) {
    return route;
  }));
}
