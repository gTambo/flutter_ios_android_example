import 'package:flutter/material.dart';

class AndroidElevatedButton extends StatelessWidget {
  const AndroidElevatedButton(
      {super.key, required this.onPressed, required this.label});

  final String label;

  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        label.toUpperCase(),
      ),
    );
  }
}
