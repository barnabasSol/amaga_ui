// ignore_for_file: non_constant_identifier_names
import 'package:amaga/features/registerer/repository/cylinder_logic.dart';
import 'package:amaga/features/registerer/widgets/pop_up.dart';
import 'package:amaga/models/cylinder.dart';
import 'package:amaga/shared/widgets/custom_button.dart';
import 'package:amaga/shared/widgets/custom_input.dart';
import 'package:amaga/shared/widgets/drop_down.dart';
import 'package:flutter/material.dart';

class AddCylinderPage extends StatefulWidget {
  const AddCylinderPage({super.key});

  @override
  State<AddCylinderPage> createState() => _State();
}

class _State extends State<AddCylinderPage> {
  List<String> labels = ["Serial Number", "Liter", "Color"];
  List<String> items = ["F", "T", "M"];
  List<TextEditingController> textControllers = [];
  String selected_gas = "";

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red[800],
        content: Text(message),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    textControllers = List.generate(
      labels.length,
      (index) => TextEditingController(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 2,
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text(
          'Add Cylinder',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.only(left: 13, right: 13),
        children: [
          const SizedBox(height: 50),
          ...List.generate(
            labels.length,
            (index) => CustomInput(
              input_controller: textControllers[index],
              label: labels[index],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          CustomDropDown(
            onSelected: (String value) {
              selected_gas = value;
            },
            items: items,
          ),
          const SizedBox(
            height: 30,
          ),
          CustomButton(
            onClicked: () {
              String serialId = textControllers[0].text;
              String volumeText = textControllers[1].text;
              String color = textControllers[2].text;
              String type = selected_gas;

              String? errorMessage = CylinderLogic()
                  .validateInputs(serialId, volumeText, color, type);

              if (errorMessage != null) {
                showSnackBar(context, errorMessage);
              } else {
                int volume = int.parse(volumeText);
                Cylinder newCylinder = Cylinder(
                  serialId: serialId,
                  volume: volume,
                  color: color,
                  type: type,
                );
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return CylinderAddPopUp(newCylinder: newCylinder);
                  },
                );
              }
            },
            label: 'Add Cylinder',
            width: 200,
            height: 60,
          ),
        ],
      ),
    );
  }
}
