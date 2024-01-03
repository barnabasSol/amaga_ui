import 'package:flutter/material.dart';

class UserCart extends StatelessWidget {
  const UserCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        height: 85,
        //padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        alignment: Alignment.center,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: Theme.of(context).colorScheme.surfaceVariant,
              ),
              padding: const EdgeInsets.all(3.5),
              child: const Icon(
                size: 30,
                Icons.person,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "MSGNAN BEZABEH",
                  style: TextStyle(color: Colors.grey, fontSize: 15),
                ),
                Text(
                  "buzunachew@gmail.com",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                Text("0911223344",
                    style: TextStyle(fontWeight: FontWeight.w500)),
                Text("12 Cylinders",
                    style: TextStyle(color: Colors.grey, fontSize: 13))
              ],
            )
          ],
        ),
      ),
    );
  }
}
