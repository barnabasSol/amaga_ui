// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';

class PasswordInput extends StatelessWidget {
  final bool? isValid;
  final TextEditingController input_controller;
  const PasswordInput({Key? key, this.isValid, required this.input_controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).colorScheme.primary;
    return SizedBox(
      width: 390,
      child: TextFormField(
        controller: input_controller,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide:
                const BorderSide(color: Color.fromARGB(255, 168, 167, 166)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide(color: primaryColor),
          ),
          labelText: 'Password',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
        ),
        obscureText: true,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your password';
          }
          return null;
        },
      ),
    );
  }
}
