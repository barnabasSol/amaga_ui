import 'package:amaga/features/exchange/widgets/profile_container.dart';
import 'package:flutter/material.dart';

class ExchangeLayoutWidget extends StatelessWidget {
  final Widget body;
  const ExchangeLayoutWidget({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    String customername = "Ana Abebe";
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child: SizedBox(
          width: size.width > 500 ? size.width : 500,
          height: size.height > 670 ? size.height : 670,
          child: Row(
            children: [
              GetProfileContainer(
                customername: customername,
              ),
              Flexible(
                child: body,
              )
            ],
          ),
        ),
      ),
    );
  }
}
