import 'package:amaga/shared/mockdata/cylinder_data.dart';
import 'package:amaga/shared/widgets/customer_detail.dart';
import 'package:amaga/shared/widgets/cylinder_card_with_checkbox.dart';
import 'package:flutter/material.dart';

class ReturnCylindersPage extends StatefulWidget {
  const ReturnCylindersPage(
      {super.key, required this.name, this.email, required this.phoneNumber});

  final String name;
  final String? email;
  final String phoneNumber;

  @override
  State<ReturnCylindersPage> createState() => _ReturnCylindersPageState();
}

class _ReturnCylindersPageState extends State<ReturnCylindersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        titleSpacing: 2,
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          setState(() {
            cylinder_data = cylinder_data.reversed.toList();
          });
          await Future.delayed(
            const Duration(seconds: 0),
          );
        },
        child: ListView(
          padding: const EdgeInsets.only(left: 20, right: 20),
          children: [
            const SizedBox(
              height: 20,
            ),
            CustomerDetail(
              name: widget.name,
              phoneNumber: widget.phoneNumber,
              email: widget.email,
            ),
            const SizedBox(height: 15),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Cylinders",
                  style: TextStyle(
                    color: Color.fromARGB(255, 129, 129, 129),
                    fontSize: 20,
                  ),
                ),
                Text(
                  "12",
                  style: TextStyle(
                    color: Color.fromARGB(255, 129, 129, 129),
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            const Divider(
              color: Colors.grey,
              height: 14,
              thickness: 1,
            ),
            const SizedBox(height: 24),
            ...List.generate(
              cylinder_data.length,
              (index) => CylinderCardWithCheckBox(
                color: cylinder_data[index].color,
                serialId: cylinder_data[index].serialId,
                volume: cylinder_data[index].volume.toString(),
                type: cylinder_data[index].type,
                onSelected: (String s) {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
