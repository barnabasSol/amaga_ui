import 'package:flutter/material.dart';

class ConstrainedFlexible extends StatelessWidget {
  final double minWidth;
  final double maxWidth;
  final double minHeight;
  final double maxHeight;
  final int flex;
  final int flexSum;
  final Widget child;

  const ConstrainedFlexible(
      {super.key,
      this.minWidth = 0,
      this.maxWidth  = double.infinity,
      this.minHeight  = 0,
      this.maxHeight = double.infinity,
      this.flex = 1,
      this.flexSum = 1,
      required this.child});
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return SingleChildScrollView(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: minWidth,
              maxWidth: maxWidth,
              minHeight: minHeight,
              maxHeight: maxHeight,
            ),
            child: SizedBox(
              width: _getSize(constraints.maxWidth),
              height: _getSize(constraints.maxHeight),
              child: child,
            ),
          ),
        ),
      );
    });
  }

  double _getSize(double outerContainer) {
    
    return outerContainer * flex / flexSum;
  }
}
