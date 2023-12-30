import 'package:amaga/features/exchange/widgets/layout_widget.dart';
import 'package:amaga/shared/mockdata/customer_list_data.dart';
import 'package:amaga/shared/widgets/custom_button.dart';
import 'package:amaga/shared/widgets/search.dart';
import 'package:flutter/material.dart';

class ExchangeLog extends StatefulWidget {
  const ExchangeLog({super.key});

  @override
  State<ExchangeLog> createState() => _ExchangeHistoryState();
}

class _ExchangeHistoryState extends State<ExchangeLog> {
  @override
  Widget build(BuildContext context) {
    return ExchangeLayoutWidget(
      body: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, bottom: 65),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 35),
              const SizedBox(
                height: 40,
                child: Row(
                  children: [
                    Expanded(child: Search()),
                    CustomButton(label: "Search", width: 130, height: 40),
                  ],
                ),
              ),
              const SizedBox(height: 35),
              Expanded(child: LayoutBuilder(builder: (context, constraints) {
                return SingleChildScrollView(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: ConstrainedBox(
                        constraints:
                            BoxConstraints(minWidth: constraints.maxWidth),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 40 , right: 20),
                          child: createTable(),
                        )),
                  ),
                );
              })),
            ],
          ),
        ),
      ),
    );
  }

  Widget createTable() {
    return DataTable(
      horizontalMargin: 30,
      dataRowMinHeight: 50,
      dataRowMaxHeight: 60,
      border: const TableBorder(
        horizontalInside: BorderSide(
          color: Color(0xffE7EAEE),
        ),
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      headingTextStyle: const TextStyle(
        color: Color(0xff64748b),
      ),
      columns: const <DataColumn>[
        DataColumn(
          label: Text('Employee Name'),
        ),
        DataColumn(
          label: Text('Email'),
        ),
        DataColumn(
          label: Text('Phone Number'),
        ),
        DataColumn(
          label: Text('Cylinder'),
        )
      ],
      rows: List<DataRow>.generate(
        customers.length,
        (index) => DataRow(
          cells: <DataCell>[
            DataCell(Text(customers[index].name)),
            DataCell(Text(customers[index].email)),
            DataCell(Text(customers[index].phone)),
            DataCell(Text(customers[index].cylinders.toString())),
          ],
        ),
      ),
    );
  }
}
