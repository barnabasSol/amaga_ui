import 'package:amaga/shared/mockdata/customer_list_data.dart';
import 'package:amaga/shared/mockdata/cylinder_data.dart';
import 'package:amaga/shared/widgets/filtering_list.dart';
import 'package:amaga/shared/widgets/pill.dart';
import 'package:amaga/shared/widgets/search.dart';
import 'package:flutter/material.dart';

class TesterMainPage extends StatefulWidget {
  const TesterMainPage({super.key});
  final String role = "tester";

  @override
  State<TesterMainPage> createState() => _TesterMainPageState();
}

class _TesterMainPageState extends State<TesterMainPage> {
  bool byCustomer = true;
  bool byCylinder = false;

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).colorScheme.primary;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      floatingActionButton: SizedBox(
        height: 70,
        width: 70,
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: primaryColor,
          shape: const CircleBorder(eccentricity: 0),
          foregroundColor: Colors.white,
          child: const Icon(Icons.add),
        ),
      ),
      drawer: const Drawer(),
      appBar: AppBar(
        titleSpacing: 2,
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text(
          'Tester',
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
              role: widget.role,
              byCustomer: byCustomer,
              byCylinder: byCylinder,
              customers: customers,
              cylinders: cylinder_data)
        ],
      ),
    );
  }
}
