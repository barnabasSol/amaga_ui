// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class CustomInputControl extends StatelessWidget {
  final bool? isValid;
  final String? label;
  final input_controller;
  final Color fillColor;
  final double width;
  final double height;
  final Color borderColor;

  const CustomInputControl(
      {Key? key,
      this.isValid,
      required this.input_controller,
      this.label,
      this.fillColor = Colors.white,
      this.width = double.infinity,
      this.height = 45,
      this.borderColor = const Color(0xffe3e5e5)})
      : super(key: key);

//email or phonenumber input
  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).colorScheme.primary;
    return SizedBox(
      width: width,
      height: height,
      child: TextFormField(
        controller: input_controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: fillColor,
          focusColor: fillColor,
          hoverColor: fillColor,
          labelText: label,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: borderColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(13),
            borderSide: BorderSide(color: primaryColor),
          ),
          border: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(13.0), // Set the border radius here
          ),
        ),
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your email or phone number';
          }
          return null;
        },
      ),
    );
  }
}
