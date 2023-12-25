// ignore_for_file: non_constant_identifier_names
import 'package:amaga/features/fill/widgets/fill_confirmation.dart';
import 'package:amaga/shared/widgets/custom_button.dart';
import 'package:amaga/shared/widgets/drop_down.dart';
import 'package:amaga/shared/widgets/submission_detail.dart';
import 'package:flutter/material.dart';

class FillSubmissionPage extends StatefulWidget {
  final String customer_name;
  final String serial_id;
  final String volume;
  const FillSubmissionPage({
    super.key,
    required this.customer_name,
    required this.serial_id,
    required this.volume,
  });

  @override
  State<FillSubmissionPage> createState() => FillSubmissionPageState();
}

class FillSubmissionPageState extends State<FillSubmissionPage> {
  List<String> items = ["F", "T", "M"];
  String selected_gas = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        titleSpacing: 2,
        title: const Text(
          "Fill",
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: ListView(
          children: [
            const SizedBox(
              height: 15,
            ),
            SubmissionDetail(
                name: widget.customer_name,
                serial_id: widget.serial_id,
                volume: widget.volume),
            const SizedBox(height: 15),
            CustomDropDown(
              onSelected: (String value) {
                selected_gas = value;
              },
              items: items,
            ),
            const SizedBox(height: 15),
            CustomButton(
              onClicked: () {
                if (selected_gas.isNotEmpty) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return FillConfirmation(
                        gas_type: selected_gas,
                        parent_context: context,
                      );
                    },
                  );
                }
              },
              label: "Submit",
              width: 140,
              height: 60,
            ),
          ],
        ),
      ),
    );
  }
}
