// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  const Search({Key? key, this.input_controller, this.onSubmitted})
      : super(key: key);

  final TextEditingController? input_controller;
  final void Function(String)? onSubmitted;

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).colorScheme.primary;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: input_controller,
        onSubmitted: onSubmitted,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: 'Search...',
          prefixIcon: const Icon(CupertinoIcons.search, color: Colors.grey),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide:
                const BorderSide(color: Color.fromARGB(255, 168, 167, 166)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide(color: primaryColor),
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        ),
      ),
    );
  }
}
