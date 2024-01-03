import 'package:amaga/features/exchange/widgets/cylinder_card_exchange.dart';
import 'package:amaga/features/exchange/widgets/input_control.dart';
import 'package:amaga/shared/mockdata/cylinder_data.dart';
import 'package:amaga/shared/widgets/custom_button.dart';
import 'package:amaga/shared/widgets/custom_input.dart';
import 'package:amaga/shared/widgets/drop_down.dart';
import 'package:amaga/shared/widgets/search.dart';
import 'package:flutter/material.dart';

class PopUpAddCylinder extends StatefulWidget {
  const PopUpAddCylinder({
    super.key,
  });

  @override
  State<PopUpAddCylinder> createState() => _PopUpAddCylinderState();
}

class _PopUpAddCylinderState extends State<PopUpAddCylinder> {
  final serialNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceVariant,
        borderRadius: BorderRadius.circular(20),
      ),

      //width: size.width < 500? 500: size.width,
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: Column(
        children: [
          const SizedBox(height: 35),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Add Cylinder",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(height: 15),
          CustomInputControl(
            input_controller: serialNumberController,
            label: "Serial number",
          ),
          const SizedBox(height: 8),
          CustomInputControl(
            input_controller: serialNumberController,
            label: "Litre",
          ),
          const SizedBox(height: 8),
          CustomInputControl(
            input_controller: serialNumberController,
            label: "Color",
          ),
          const SizedBox(height: 8),
          CustomDropDown(
            onSelected: (String value) {},
            items: const ["one", "two"],
            height: 45,
            borderColor: const Color(0xffe3e5e5),
            //input_controller: serialNumberController,
            //label: "Gas Type",
          ),
          const SizedBox(
            height: 10,
          ),
          const Align(
            alignment: Alignment.bottomRight,
            child: CustomButton(label: "Done", width: 130, height: 40),
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    serialNumberController.dispose();
    super.dispose();
  }
}
