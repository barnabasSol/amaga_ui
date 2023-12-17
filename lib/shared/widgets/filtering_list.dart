import 'package:amaga/features/tester/pages/customer_cylinders_t.dart';
import 'package:amaga/models/customer.dart';
import 'package:amaga/models/cylinder.dart';
import 'package:amaga/shared/mockdata/customer_list_data.dart';
import 'package:amaga/shared/widgets/customer_card.dart';
import 'package:amaga/shared/widgets/cylinder_card_no_type.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FilteredList extends StatefulWidget {
  final bool byCustomer;
  final bool byCylinder;
  List<Customer> customers;
  List<Cylinder> cylinders;
  FilteredList({
    super.key,
    required this.byCustomer,
    required this.byCylinder,
    required this.customers,
    required this.cylinders,
  });

  @override
  State<FilteredList> createState() => _FilteredListState();
}

class _FilteredListState extends State<FilteredList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RefreshIndicator(
        onRefresh: () async {
          setState(() {
            if (widget.byCustomer) {
              widget.customers = widget.customers.take(4).toList();
            } else if (widget.byCylinder) {
              widget.cylinders = widget.cylinders.take(4).toList();
            }
          });
          await Future.delayed(
            const Duration(seconds: 2),
          );
        },
        child: widget.byCustomer
            ? ListView.builder(
                padding: const EdgeInsets.only(left: 13, right: 13),
                itemCount: widget.customers.length,
                itemBuilder: (context, index) => CustomerCard(
                  name: widget.customers[index].name,
                  email: widget.customers[index].email,
                  phone: widget.customers[index].phone,
                  cylinders: widget.customers[index].cylinders,
                  onClicked: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CustomerCylinderT(
                          customer_name: customers[index].name,
                        ),
                      ),
                    );
                  },
                ),
              )
            : ListView.builder(
                padding: const EdgeInsets.only(left: 13, right: 13),
                itemCount: widget.cylinders.length,
                itemBuilder: (context, index) => CylinderCardNoType(
                  color: widget.cylinders[index].color,
                  serialId: widget.cylinders[index].serialId,
                  volume: widget.cylinders[index].volume.toString(),
                ),
              ),
      ),
    );
  }
}
