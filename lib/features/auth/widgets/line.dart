import 'package:flutter/material.dart';

class Line extends StatefulWidget {
  const Line({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LineState createState() => _LineState();
}

class _LineState extends State<Line> {
  double lineWidth = 0;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        lineWidth = 90;
      });
    });
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
