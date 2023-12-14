// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  final bool? isValid;
  final String? label;
  final input_controller;

  const Input({Key? key, this.isValid, this.input_controller, this.label})
      : super(key: key);

//email or phonenumber input
  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).colorScheme.primary;
    return SizedBox(
      width: 390,
      height: 90,
      child: TextFormField(
        decoration: InputDecoration(
          labelText: label,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide:
                const BorderSide(color: Color.fromARGB(255, 168, 167, 166)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide(color: primaryColor),
          ),
          border: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(18.0), // Set the border radius here
          ),
        ),
        keyboardType: TextInputType.emailAddress,
      ),
    );
  }
}
