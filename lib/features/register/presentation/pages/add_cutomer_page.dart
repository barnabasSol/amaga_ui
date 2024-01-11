// ignore_for_file: non_constant_identifier_names
import 'package:amaga/features/register/presentation/widgets/add_customer_button.dart';
import 'package:amaga/shared/widgets/custom_input.dart';
import 'package:flutter/material.dart';

class AddCustomerpage extends StatefulWidget {
  const AddCustomerpage({super.key});

  @override
  State<AddCustomerpage> createState() => _AddCustomerpageState();
}

class _AddCustomerpageState extends State<AddCustomerpage> {
  List<String> labels = ["Name", "Phone Number", "Email (Optional)"];
  List<TextEditingController> textControllers = [];

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
        titleSpacing: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text(
          'Add Customer',
          style: TextStyle(
            color: Colors.white,
            fontSize: 26,
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
            height: 30,
          ),
          AddCustomerButton(onClicked: () {}),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
