import 'package:flutter/material.dart';

class ErrorMesage extends StatelessWidget {
  final String message;
  final bool isVisible;
  const ErrorMesage(
      {super.key, required this.message, required this.isVisible});

  @override
  Widget build(BuildContext context) {
    return Text(
      isVisible ? message : "",
      style: const TextStyle(color: Colors.red, fontSize: 26),
    );
  }
}
