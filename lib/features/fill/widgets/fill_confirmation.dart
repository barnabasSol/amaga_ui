// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class FillConfirmation extends StatelessWidget {
  const FillConfirmation({
    super.key,
    required this.gas_type,
    required this.parent_context,
  });
  final BuildContext parent_context;
  final String gas_type;

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).colorScheme.primary;
    return AlertDialog(
      elevation: 0,
      title: const Text('Confirm'),
      content: Text(
        'Fill this cylinder with gas type: $gas_type?',
        style: const TextStyle(fontSize: 20),
      ),
      actions: [
        TextButton(
          child: const Text(
            'Cancel',
            style: TextStyle(fontSize: 18),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: const Text(
            'OK',
            style: TextStyle(fontSize: 18),
          ),
          onPressed: () {
            Navigator.of(context).pop();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  backgroundColor: primaryColor,
                  content: const Text('Cylinder Successfuly Filled!')),
            );
            Navigator.pop(parent_context);
          },
        ),
      ],
    );
  }
}
