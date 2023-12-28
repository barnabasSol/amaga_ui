import 'package:flutter/material.dart';

class ShowProfile extends StatelessWidget {
  final String name;

  const ShowProfile({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    var primaryColor = Theme.of(context).colorScheme.primary;
    return Container(
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      alignment: Alignment.topCenter,
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Stack(
            children: [
              CircleAvatar(
                backgroundColor: primaryColor,
                radius: 50,
                foregroundImage:
                    const NetworkImage('http://i.imgur.com/QSev0hg.jpg'),
                child: Text(
                  name[0].toString(),
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Positioned(
                bottom: 5,
                right: 2,
                child: CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.surface,
                  radius: 12,
                  child: CircleAvatar(
                    backgroundColor: primaryColor,
                    radius: 10,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "${name[0].toUpperCase()}${name.substring(1)}",
            style: const TextStyle(
              color: Colors.black,
              fontSize: 27,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
