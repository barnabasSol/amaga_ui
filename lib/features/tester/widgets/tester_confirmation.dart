// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class TesterPopUp extends StatelessWidget {
  final List<String> selectedItems;
  final BuildContext parent_context;

  const TesterPopUp(
      {Key? key, required this.selectedItems, required this.parent_context})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).colorScheme.primary;
    return AlertDialog(
      elevation: 0,
      title: const Text('Confirm'),
      content: Text(
        selectedItems.join(", "),
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
                content: const Text(
                  'Submitted Successfully!',
                  style: TextStyle(fontSize: 17),
                ),
              ),
            );
            Navigator.pop(parent_context);
          },
        ),
      ],
    );
  }
}
