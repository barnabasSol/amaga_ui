import 'package:amaga/features/exchange/widgets/layout_widget.dart';
import 'package:amaga/shared/mockdata/cylinder_data.dart';
import 'package:amaga/shared/widgets/custom_button.dart';
import 'package:amaga/shared/widgets/cylinder_card_no_type.dart';
import 'package:amaga/shared/widgets/search.dart';
import 'package:flutter/material.dart';

class ExchangeHistory extends StatefulWidget {
  const ExchangeHistory({super.key});

  @override
  State<ExchangeHistory> createState() => _ExchangeHistoryState();
}

class _ExchangeHistoryState extends State<ExchangeHistory> {
  @override
  Widget build(BuildContext context) {
    return ExchangeLayoutWidget(
      body: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, bottom: 65),
          child: ListView(
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
              ...List.generate(
                cylinder_data.length,
                (index) => CylinderCardNoType(
                  color: cylinder_data[index].color,
                  serialId: cylinder_data[index].serialId,
                  volume: cylinder_data[index].volume.toString(),
                  onClicked: () {},
                ),
              ),
            ],
          ),
        ),
        floatingActionButton:
            const CustomButton(label: "Add Cylinder", width: 240, height: 40),
      ),
    );
  }
}
