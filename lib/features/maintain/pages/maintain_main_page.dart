import 'package:amaga/shared/mockdata/customer_list_data.dart';
import 'package:amaga/shared/mockdata/cylinder_data.dart';
import 'package:amaga/shared/widgets/filtering_list.dart';
import 'package:amaga/shared/widgets/pill.dart';
import 'package:amaga/shared/widgets/search.dart';
import 'package:flutter/material.dart';

class MaintainMainPage extends StatefulWidget {
  const MaintainMainPage({super.key, required this.token});

  final String role = "maintain";

  final String token;
  @override
  State<MaintainMainPage> createState() => _MaintainMainPageState();
}

class _MaintainMainPageState extends State<MaintainMainPage> {
  bool byCustomer = true;
  bool byCylinder = false;
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
          'Maintain',
          style: TextStyle(color: Colors.white, fontSize: 29),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          const Search(),
          const SizedBox(
            height: 10,
          ),
          Pill(
            label1: 'By Customer',
            label2: 'By Cylinder',
            isSelected1: byCustomer,
            isSelected2: byCylinder,
            onPressed1: () {
              setState(() {
                byCustomer = true;
                byCylinder = false;
              });
            },
            onPressed2: () {
              setState(() {
                byCylinder = true;
                byCustomer = false;
              });
            },
          ),
          const SizedBox(
            height: 10,
          ),
          FilteredList(
            byCustomer: byCustomer,
            byCylinder: byCylinder,
            customers: customers,
            cylinders: cylinder_data,
            role: widget.role,
          )
        ],
      ),
    );
  }
}
