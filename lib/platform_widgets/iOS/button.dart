import 'package:flutter/cupertino.dart';

class IOSButton extends StatelessWidget {
  const IOSButton({
    super.key,
    required this.onPressed,
    required this.label,
  });

  final Function()? onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton.filled(
      // color: Colors.white,
      onPressed: onPressed,
      child: Text(
        label.toUpperCase(),
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
