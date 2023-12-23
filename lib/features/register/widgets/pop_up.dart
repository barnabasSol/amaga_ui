import 'package:amaga/features/register/repository/cylinder_logic.dart';
import 'package:amaga/models/cylinder.dart';
import 'package:flutter/material.dart';

class CylinderAddPopUp extends StatelessWidget {
  final Cylinder newCylinder;
  const CylinderAddPopUp({super.key, required this.newCylinder});

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).colorScheme.primary;
    return AlertDialog(
      elevation: 0,
      title: const Text('Confirm'),
      content: Text(
        'Are you sure you want to add this cylinder?\n\n'
        'Serial ID: ${newCylinder.serialId}\n'
        'Color: ${newCylinder.color}\n'
        'Type: ${newCylinder.type}\n'
        'Volume: ${newCylinder.volume}',
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
            bool isAdded = CylinderLogic().addCylinder(newCylinder);
            if (isAdded) {
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    backgroundColor: primaryColor,
                    content: const Text('Cylinder added successfully!')),
              );
              Navigator.pop(context);
            } else {
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.red[800],
                  content: const Text('give proper input'),
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
