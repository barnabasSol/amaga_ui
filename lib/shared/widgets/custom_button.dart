import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onClicked;
  final String label;
  final double width;
  final double height;
  final bool? isLoading;
  const CustomButton({
    Key? key,
    this.onClicked,
    required this.label,
    required this.width,
    required this.height,
    this.isLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextButton(
        onPressed: isLoading! ? null : onClicked,
        style: TextButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(17.0),
          ),
        ),
        child: isLoading!
            ? const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              )
            : Text(
                label,
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
      ),
    );
  }
}
