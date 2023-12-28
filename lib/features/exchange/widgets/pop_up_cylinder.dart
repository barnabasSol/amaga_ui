import 'package:amaga/features/exchange/widgets/cylinder_card_exchange.dart';
import 'package:amaga/shared/mockdata/cylinder_data.dart';
import 'package:amaga/shared/widgets/custom_button.dart';
import 'package:amaga/shared/widgets/search.dart';
import 'package:flutter/material.dart';

class PopUpCylinder extends StatelessWidget {
  const PopUpCylinder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceVariant,
        borderRadius: BorderRadius.circular(20),
      ),

      //width: size.width < 500? 500: size.width,
      padding: const EdgeInsets.only(left: 30, right: 10, bottom: 100),
      child: Column(
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
          const SizedBox(height: 15),
          Expanded(
            child: ListView(
              children: [
                //const SizedBox(height: 35),
                ...List.generate(
                  cylinder_data.length,
                  (index) => CylinderCardExhange(
                    color: cylinder_data[index].color,
                    serialId: cylinder_data[index].serialId,
                    volume: cylinder_data[index].volume.toString(),
                    onClicked: () {}, 
                    isIconVisible: false,
                    
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

