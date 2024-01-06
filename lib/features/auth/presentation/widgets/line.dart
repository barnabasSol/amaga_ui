import 'package:flutter/material.dart';

class Line extends StatefulWidget {
  const Line({Key? key}) : super(key: key);

  @override
  State<Line> createState() => _LineState();
}

class _LineState extends State<Line> {
  double lineWidth = 0;

  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 1),
      () {
        setState(() {
          lineWidth = 100;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 8),
      child: AnimatedContainer(
        duration: const Duration(seconds: 1),
        width: lineWidth,
        height: 7,
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
