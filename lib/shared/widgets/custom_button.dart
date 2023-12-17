import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final void Function() onClicked;
  final String label;
  final double width;
  final double height;
  const CustomButton(
      {Key? key,
      required this.onClicked,
      required this.label,
      required this.width,
      required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width, // Specify your desired width
      height: height,
      child: TextButton(
        onPressed: onClicked,
        style: TextButton.styleFrom(
          backgroundColor:
              Theme.of(context).colorScheme.primary, // Set the background color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(17.0), // Set the border radius
          ),
        ),
        child: Text(
          label,
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}
