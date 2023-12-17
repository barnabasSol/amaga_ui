import 'package:flutter/material.dart';

class CylinderCardNoType extends StatelessWidget {
  const CylinderCardNoType({
    super.key,
    required this.color,
    required this.serialId,
    required this.volume,
    this.onClicked,
  });

  final void Function()? onClicked;
  final String color;
  final String serialId;
  final String volume;

  Color getColor(String colorName) {
    switch (colorName) {
      case 'red':
        return Colors.red;
      case 'blue':
        return Colors.blue;
      case 'green':
        return Colors.green;
      default:
        return Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClicked,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        height: 70,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: Colors.white),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: getColor(color),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 30,
              child: Container(
                padding: const EdgeInsets.only(left: 13, top: 13, bottom: 7),
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      serialId,
                      style: const TextStyle(
                          fontSize: 14,
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '$volume Liters',
                      style: const TextStyle(
                          fontSize: 17,
                          color: Color.fromARGB(255, 90, 90, 90),
                          fontWeight: FontWeight.w900),
                    ),
                  ],
                ),
              ),
            ),
            const Expanded(
              flex: 4,
              child: Icon(
                Icons.arrow_forward_ios,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
