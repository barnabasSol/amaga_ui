import 'package:flutter/material.dart';

class CylinderCard extends StatelessWidget {
  const CylinderCard(
      {super.key,
      required this.color,
      required this.serialId,
      required this.volume,
      required this.type});

  final String color;
  final String serialId;
  final String volume;
  final String type;

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
    Color primaryColor = Theme.of(context).colorScheme.primary;
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
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
            flex: 15,
            child: Container(
              padding: const EdgeInsets.only(left: 7, top: 7, bottom: 7),
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
          Expanded(
            flex: 4,
            child: Container(
              alignment: Alignment.center,
              color: type.toLowerCase() == "f" ? primaryColor : Colors.white,
              child: Text(
                'F',
                style: TextStyle(
                    color: type.toLowerCase() != "f"
                        ? const Color.fromARGB(255, 155, 153, 153)
                        : Colors.white,
                    fontSize: 20),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              alignment: Alignment.center,
              color: type.toLowerCase() == "m" ? primaryColor : Colors.white,
              child: Text(
                'M',
                style: TextStyle(
                    color: type.toLowerCase() != "m"
                        ? const Color.fromARGB(255, 155, 153, 153)
                        : Colors.white,
                    fontSize: 20),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              decoration: BoxDecoration(
                color: type.toLowerCase() == "t" ? primaryColor : Colors.white,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
              alignment: Alignment.center,
              child: Text(
                'T',
                style: TextStyle(
                  color: type.toLowerCase() != "t"
                      ? const Color.fromARGB(255, 155, 153, 153)
                      : Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
