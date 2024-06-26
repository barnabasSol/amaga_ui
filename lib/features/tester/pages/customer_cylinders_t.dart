// ignore_for_file: non_constant_identifier_names
import 'package:amaga/features/tester/pages/tester_submission_page.dart';
import 'package:amaga/shared/mockdata/cylinder_data.dart';
import 'package:amaga/shared/widgets/cylinder_card_no_type.dart';
import 'package:amaga/shared/widgets/search.dart';
import 'package:flutter/material.dart';

class CustomerCylindersPageT extends StatefulWidget {
  const CustomerCylindersPageT({super.key, required this.customer_name});

  final String customer_name;

  @override
  State<CustomerCylindersPageT> createState() => CustomerCylindersTState();
}

class CustomerCylindersTState extends State<CustomerCylindersPageT> {
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
        child: RefreshIndicator(
          onRefresh: () async {
            setState(() {
              cylinder_data = cylinder_data.reversed.toList();
            });
            await Future.delayed(
              const Duration(seconds: 0),
            );
          },
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
                        builder: (context) => TesterSubmissionPage(
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
      ),
    );
  }
}
