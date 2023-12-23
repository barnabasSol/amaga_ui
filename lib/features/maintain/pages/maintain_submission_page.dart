// ignore_for_file: non_constant_identifier_names
import 'package:amaga/features/tester/widgets/tester_confirmation.dart';
import 'package:amaga/shared/widgets/check_box_list.dart';
import 'package:amaga/shared/widgets/custom_button.dart';
import 'package:amaga/shared/widgets/submission_detail.dart';
import 'package:flutter/material.dart';

class MaintainSubmissionPage extends StatefulWidget {
  final String customer_name;
  final String serial_id;
  final String volume;
  const MaintainSubmissionPage({
    super.key,
    required this.customer_name,
    required this.serial_id,
    required this.volume,
  });

  @override
  State<MaintainSubmissionPage> createState() => MaintainSubmissionPageState();
}

class MaintainSubmissionPageState extends State<MaintainSubmissionPage> {
  List<String> selectedItems = [];

  void handleItemSelected(String value) {
    setState(() {
      if (selectedItems.contains(value)) {
        selectedItems.remove(value);
      } else {
        selectedItems.add(value);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        titleSpacing: 2,
        title: const Text(
          "Maintain",
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
            CheckList(
              items: const ['Gear', 'Valve', 'T-Bolt'],
              onItemSelected: (String value) => handleItemSelected(value),
            ),
            const SizedBox(height: 15),
            CustomButton(
              onClicked: () {
                if (selectedItems.isNotEmpty) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return TesterPopUp(
                        selectedItems: selectedItems,
                        parent_context: context,
                      );
                    },
                  );
                }
              },
              isLoading: false,
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
