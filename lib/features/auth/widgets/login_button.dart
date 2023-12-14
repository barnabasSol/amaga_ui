import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final void Function() onClicked;

  const LoginButton({Key? key, required this.onClicked}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350, // Specify your desired width
      height: 60,
      child: TextButton(
        onPressed: onClicked,
        style: TextButton.styleFrom(
          backgroundColor:
              Theme.of(context).colorScheme.primary, // Set the background color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(17.0), // Set the border radius
          ),
        ),
        child: const Text(
          'Login',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}
