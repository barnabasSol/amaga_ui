import 'package:flutter/material.dart';

class CustomerDetail extends StatelessWidget {
  final String name;
  final String? email;
  final String phoneNumber;
  const CustomerDetail(
      {super.key, required this.name, this.email, required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).colorScheme.primary;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(13),
      ),
      alignment: Alignment.topCenter,
      height: 270,
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          CircleAvatar(
            backgroundColor: primaryColor,
            radius: 50,
            child: Text(
              name[0].toUpperCase(),
              style: const TextStyle(fontSize: 32, color: Colors.white),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            name[0].toUpperCase() + name.substring(1),
            style: const TextStyle(
              color: Colors.black,
              fontSize: 27,
            ),
          ),
          Text(
            email != null ? email! : 'No email',
            style: const TextStyle(
              color: Color.fromARGB(255, 129, 129, 129),
              fontSize: 22,
            ),
          ),
          Text(
            phoneNumber,
            style: const TextStyle(
              color: Color.fromARGB(255, 129, 129, 129),
              fontSize: 22,
            ),
          ),
        ],
      ),
    );
  }
}
