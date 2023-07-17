import 'package:flutter/material.dart';

const mainTextStyle = TextStyle(fontSize: 20);

void nextPage(BuildContext context, Widget route) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) {
    return route;
  }));
}
