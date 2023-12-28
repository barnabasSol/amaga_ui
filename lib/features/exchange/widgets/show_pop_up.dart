import 'dart:ui';
import 'package:amaga/features/exchange/widgets/pop_up_cylinder.dart';
import 'package:flutter/material.dart';

class ShowPopUp {
  static cylinderPopUp(BuildContext context) {
    double minWidth = 300;
    double maxWidth = 700;

    showDialog(
      barrierDismissible: true,
      barrierColor: const Color.fromARGB(20, 255, 255, 255), //this works

      context: context,
      builder: (context) => BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Center(
          child: SingleChildScrollView(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SizedBox(
                width: MediaQuery.of(context).size.width >= maxWidth
                    ? maxWidth
                    : MediaQuery.of(context).size.width <= minWidth
                        ? minWidth
                        : MediaQuery.of(context).size.width,
                height: 600,
                child: const Material(
                  color: Colors.transparent,
                  child: PopUpCylinder(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
