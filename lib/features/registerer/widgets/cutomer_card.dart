import 'package:flutter/material.dart';

class CustomerCard extends StatelessWidget {
  final String name;
  final String email;
  final String phone;
  final int cylinders;
  final void Function()? onClicked;

  const CustomerCard({
    Key? key,
    this.onClicked,
    required this.name,
    required this.email,
    required this.phone,
    required this.cylinders,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClicked,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(13),
        ),
        height: 100,
        margin: const EdgeInsets.only(bottom: 8),
        child: Row(
          children: [
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(13),
                      bottomLeft: Radius.circular(13)),
                ),
                padding: const EdgeInsets.only(top: 8),
                alignment: Alignment.topCenter,
                child: const Icon(
                  Icons.person,
                  size: 50,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                alignment: Alignment.topLeft,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(13),
                      bottomRight: Radius.circular(13)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      name,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 21,
                      ),
                    ),
                    Text(
                      email,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 19,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          phone,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 19,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 16),
                          child: Text(
                            ' $cylinders cylinders',
                            style: const TextStyle(
                                fontSize: 20,
                                color: Color.fromARGB(255, 143, 141, 141)),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
