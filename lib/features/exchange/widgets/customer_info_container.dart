import 'package:amaga/features/exchange/widgets/customer_card.dart';
import 'package:amaga/shared/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class CustomerInfoContainer extends StatelessWidget {
  const CustomerInfoContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double minWidthforTop = 605;

    return LayoutBuilder(
      builder: (context , constraints) {
        return SingleChildScrollView(
          scrollDirection: constraints.maxWidth <= minWidthforTop
              ? Axis.horizontal
              : Axis.vertical,
          child: Container(
            margin: const EdgeInsets.all(30),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Flex(
              direction: constraints.maxWidth < minWidthforTop - 3
                  ? Axis.vertical
                  : Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                UserCart(),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 8,
                      height: 8,
                    ),
                    CustomButton(
                        label: "Search", width: 150, height: 40),
                    SizedBox(
                      width: 8,
                      height: 8,
                    ),
                    CustomButton(label: "Add", width: 150, height: 40),
                  ],
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}
