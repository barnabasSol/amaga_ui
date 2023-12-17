import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {
  final String message;
  final bool isVisible;
  const ErrorMessage({Key? key, required this.message, required this.isVisible})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible,
      child: SnackBar(
        content: Text(
          message,
          style: const TextStyle(color: Colors.red, fontSize: 26),
        ),
      ),
    );
  }
}
