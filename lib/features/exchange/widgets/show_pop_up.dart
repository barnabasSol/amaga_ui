import 'dart:ui';
import 'package:amaga/features/exchange/widgets/expandedConstrained.dart';
import 'package:amaga/features/exchange/widgets/pop_up_add_cylinder.dart';
import 'package:amaga/features/exchange/widgets/pop_up_add_remove_cylinder.dart';
import 'package:amaga/features/exchange/widgets/pop_up_cylinder.dart';
import 'package:flutter/material.dart';

class ShowPopUp {
  static _popUpLayout(
      {required BuildContext context,
      required Widget child,
      double minWidth = 300,
      double maxWidth = 700,
      double height = 600}) {
    showDialog(
      barrierDismissible: true,
      barrierColor: const Color.fromARGB(20, 255, 255, 255), //this works

      context: context,
      builder: (context) => BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Center(
          child: ConstrainedFlexible(
            minWidth: minWidth,
            maxWidth: maxWidth,
            minHeight: height,
            maxHeight: height,
            child: child,
          ),
        ),
      ),
    );
  }

  static cylinderPopUp(BuildContext context) {
    _popUpLayout(
      context: context,
      child: const Material(
        color: Colors.transparent,
        child: PopUpCylinder(),
      ),
    );
  }

  static cylinderAddRemovePopUp(BuildContext context) {
    _popUpLayout(
      context: context,
      child: const Material(
        color: Colors.transparent,
        child: PopUpAddRemoveCylinder(),
      ),
    );
  }

  static cylinderAddPopUp(BuildContext context) {
    _popUpLayout(
      height: 380,
      context: context,
      child: const Material(
        color: Colors.transparent,
        child: PopUpAddCylinder(),
      ),
    );
  }
}
