// ignore_for_file: non_constant_identifier_names

import 'package:amaga/shared/widgets/custom_button.dart';
import 'package:amaga/shared/widgets/custom_input.dart';
import 'package:flutter/material.dart';

class RentToPage extends StatelessWidget {
  const RentToPage({super.key});

  @override
  Widget build(BuildContext context) {
    final name_controller = TextEditingController();
    final phone_controller = TextEditingController();
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        titleSpacing: 2,
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text(
          "Rent To",
          style: TextStyle(
            color: Colors.white,
            fontSize: 27,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.only(left: 17, right: 17),
        children: [
          const SizedBox(height: 30),
          CustomInput(
            input_controller: name_controller,
            label: 'Name',
          ),
          const SizedBox(height: 20),
          CustomInput(
            input_controller: phone_controller,
            label: 'Phone Number',
          ),
          const SizedBox(height: 20),
          const CustomButton(label: 'Submit', width: 100, height: 50)
        ],
      ),
    );
  }
}
