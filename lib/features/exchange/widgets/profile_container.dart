import 'package:amaga/features/exchange/pages/exchange_history.dart';
import 'package:amaga/features/exchange/widgets/customer_profile.dart';
import 'package:amaga/shared/widgets/animated_line.dart';
import 'package:amaga/shared/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class GetProfileContainer extends StatelessWidget {
  final String customername;
  final double width;
  const GetProfileContainer(
      {super.key, this.width = 230, required this.customername});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      child: Container(
        color: Theme.of(context).colorScheme.surface,
        constraints: BoxConstraints.expand(
          width: width,
          height: MediaQuery.of(context).size.height > 520
              ? MediaQuery.of(context).size.height
              : 520,
        ),
        padding: const EdgeInsets.only(bottom: 13),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 450,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 18.0),
                    child: ShowProfile(name: customername),
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Exchange Stock",
                        style: TextStyle(
                            fontSize: 23, fontWeight: FontWeight.w600),
                      ),
                      AnimatedLine(
                        duration: 1000,
                        lineWidth: 170,
                        height: 2,
                      ),
                      Text("Exchange History",
                          style: TextStyle(
                              fontSize: 23, fontWeight: FontWeight.w600)),
                      AnimatedLine(
                        duration: 500,
                        lineWidth: 40,
                        height: 2,
                        initialDelay: 1500,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: CustomButton(
                        label: "Add Exchange",
                        width: 185,
                        height: 45,
                        onClicked: () {
                          Navigator.pushNamed(context, '/exchangeEdit');
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
                //height: 5,
                ),
            GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.logout),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    "Log Out",
                    style: TextStyle(fontSize: 22),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
