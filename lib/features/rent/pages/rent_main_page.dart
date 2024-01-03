import 'package:amaga/features/rent/pages/rent_cylinder_check_page.dart';
import 'package:amaga/features/rent/pages/return_page.dart';
import 'package:amaga/shared/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class RentMainPage extends StatelessWidget {
  const RentMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      drawer: const Drawer(),
      appBar: AppBar(
        titleSpacing: 2,
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text(
          "Return Cylinder",
          style: TextStyle(
            color: Colors.white,
            fontSize: 27,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.only(left: 10, right: 10),
        children: [
          const SizedBox(height: 130),
          CustomButton(
            label: 'Rent',
            width: 320,
            height: 60,
            onClicked: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) => const RentCylinderCheckPage()),
                ),
              );
            },
          ),
          const SizedBox(height: 30),
          CustomButton(
            label: 'Return',
            width: 320,
            height: 60,
            onClicked: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) => const ReturnPage()),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
