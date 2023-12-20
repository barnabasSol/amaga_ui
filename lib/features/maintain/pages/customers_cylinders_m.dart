// ignore_for_file: non_constant_identifier_names
import 'package:amaga/features/maintain/pages/maintain_submission_page.dart';
import 'package:amaga/shared/mockdata/cylinder_data.dart';
import 'package:amaga/shared/widgets/cylinder_card_no_type.dart';
import 'package:amaga/shared/widgets/search.dart';
import 'package:flutter/material.dart';

class CustomerCylindersPageM extends StatefulWidget {
  const CustomerCylindersPageM({super.key, required this.customer_name});

  final String customer_name;

  @override
  State<CustomerCylindersPageM> createState() => CustomerCylindersMState();
}

class CustomerCylindersMState extends State<CustomerCylindersPageM> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        titleSpacing: 2,
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          widget.customer_name,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: ListView(
          children: [
            const SizedBox(height: 15),
            const Search(),
            const SizedBox(height: 15),
            ...List.generate(
              cylinder_data.length,
              (index) => CylinderCardNoType(
                color: cylinder_data[index].color,
                serialId: cylinder_data[index].serialId,
                volume: cylinder_data[index].volume.toString(),
                onClicked: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MaintainSubmissionPage(
                        customer_name: widget.customer_name,
                        serial_id: cylinder_data[index].serialId,
                        volume: cylinder_data[index].volume.toString(),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
