import 'package:amaga/features/rent/pages/rent_to_page.dart';
import 'package:amaga/shared/mockdata/cylinder_data.dart';
import 'package:amaga/shared/widgets/custom_button.dart';
import 'package:amaga/shared/widgets/cylinder_card_with_checkbox.dart';
import 'package:flutter/material.dart';

class RentCylinderCheckPage extends StatefulWidget {
  const RentCylinderCheckPage({super.key});

  @override
  State<RentCylinderCheckPage> createState() => _RentCylinderCheckPageState();
}

class _RentCylinderCheckPageState extends State<RentCylinderCheckPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomButton(
        label: 'Rent',
        width: 250,
        height: 50,
        onClicked: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: ((context) => const RentToPage()),
            ),
          );
        },
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        titleSpacing: 2,
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text(
          'Check Cylinder',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.only(left: 10, right: 10),
        children: [
          const SizedBox(height: 30),
          ...List.generate(
            cylinder_data.length,
            (index) => CylinderCardWithCheckBox(
              color: cylinder_data[index].color,
              serialId: cylinder_data[index].serialId,
              volume: cylinder_data[index].volume.toString(),
              type: cylinder_data[index].type,
              onSelected: (String x) {},
            ),
          ),
        ],
      ),
    );
  }
}
