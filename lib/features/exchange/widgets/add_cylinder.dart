import 'package:amaga/features/exchange/widgets/cylinder_card_exchange.dart';
import 'package:amaga/shared/mockdata/cylinder_data.dart';
import 'package:flutter/material.dart';

class AddCylinder extends StatelessWidget {
  const AddCylinder({
    super.key,
    this.onClicked,
    required this.title
  });

  final String title;
  final void Function()? onClicked;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(10)),
            ),
            child: Text(
              title,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 15, bottom: 52),
              decoration: const BoxDecoration(
                color: Color(0xffCDCDCD),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(10)),
              ),
              child: ListView(
                children: [
                  ...List.generate(
                    cylinder_data.length,
                    (index) => CylinderCardExhange(
                      iconColor: "FF9E9E",
                      iconType: Icons.close,
                      color: cylinder_data[index].color,
                      serialId: cylinder_data[index].serialId,
                      volume: cylinder_data[index].volume.toString(),
                      onClicked: () {},
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: SizedBox(
        height: 50.0,
        width: 40.0,
        child: FittedBox(
          child: FloatingActionButton(
            heroTag: null,
            onPressed: onClicked,
            backgroundColor: Theme.of(context).colorScheme.primary,
            foregroundColor: Theme.of(context).colorScheme.onPrimary,
            elevation: 15,
            shape: const CircleBorder(),
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
