import 'package:flutter/material.dart';

class AnimatedLine extends StatefulWidget {
  final double lineWidth;
  final int duration;
  final double height;
  final int initialDelay;
  const AnimatedLine(
      {Key? key,
      this.lineWidth = 100,
      this.duration = 1000,
      this.height = 4,
      this.initialDelay = 0})
      : super(key: key);

  @override
  State<AnimatedLine> createState() => _LineState();
}

class _LineState extends State<AnimatedLine> {
  double initialWidth = 0;
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(milliseconds: widget.duration + widget.initialDelay),
      () {
        setState(() {
          initialWidth = widget.lineWidth;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: widget.duration),
      width: initialWidth,
      height: widget.height,
      color: Theme.of(context).primaryColor,
    );
  }
}
