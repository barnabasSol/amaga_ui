import 'package:flutter/material.dart';

class Pill extends StatelessWidget {
  final String label1;
  final String label2;
  final bool isSelected1;
  final bool isSelected2;
  final VoidCallback onPressed1;
  final VoidCallback onPressed2;

  const Pill({
    Key? key,
    required this.label1,
    required this.isSelected1,
    required this.isSelected2,
    required this.onPressed1,
    required this.onPressed2,
    required this.label2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 2,
            foregroundColor:
                isSelected1 ? Colors.white : Theme.of(context).primaryColor,
            backgroundColor:
                isSelected1 ? Theme.of(context).primaryColor : Colors.white,
            shape: const StadiumBorder(),
          ),
          onPressed: onPressed1,
          child: Text(
            label1,
            style: const TextStyle(fontSize: 17),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor:
                isSelected2 ? Colors.white : Theme.of(context).primaryColor,
            backgroundColor:
                isSelected2 ? Theme.of(context).primaryColor : Colors.white,
            shape: const StadiumBorder(),
          ),
          onPressed: onPressed2,
          child: Text(
            label2,
            style: const TextStyle(fontSize: 17),
          ),
        ),
      ],
    ));
  }
}
