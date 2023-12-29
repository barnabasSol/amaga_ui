import 'package:amaga/features/exchange/widgets/expandedConstrained.dart';
import 'package:amaga/features/exchange/widgets/layout_widget.dart';
import 'package:amaga/shared/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import '../widgets/add_cylinder.dart';
import '../widgets/customer_info_container.dart';
import '../widgets/show_pop_up.dart';

class ShowStockCylinder extends StatelessWidget {
  const ShowStockCylinder({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double minWidth = 667;
    double minHeight = 600;

    return ExchangeLayoutWidget(
      body: SingleChildScrollView(

        child: SizedBox(
          height: size.width < minWidth
              ? 980
              : size.height > minHeight
                  ? size.height
                  : minHeight,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CustomerInfoContainer(),
                Expanded(
                  child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: Flex(
                          direction: size.width > minWidth
                              ? Axis.horizontal
                              : Axis.vertical,
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: AddCylinder(title: "Customer Cylinder",
                                onClicked: () {
                                  ShowPopUp.cylinderAddPopUp(context);
                                },
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(child: AddCylinder(
                              title: "Exchange Stock Cylinder",
                              onClicked: () {
                              ShowPopUp.cylinderPopUp(context);
                            })),
                          ])),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  margin: const EdgeInsets.only(bottom: 10, right: 5),
                  child: const CustomButton(
                      label: "Submit", width: 160, height: 40),
                )
              ]),
        ),
      ),
    );
  }
}
