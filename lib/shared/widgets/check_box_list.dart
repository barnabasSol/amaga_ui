import 'package:flutter/material.dart';

class CheckList extends StatefulWidget {
  final List<String> items;
  final ValueChanged<String> onItemSelected;

  const CheckList({Key? key, required this.items, required this.onItemSelected})
      : super(key: key);

  @override
  State<CheckList> createState() => _CheckListState();
}

class _CheckListState extends State<CheckList> {
  Map<String, bool> checkedItems = {};

  @override
  void initState() {
    super.initState();
    for (var item in widget.items) {
      checkedItems[item] = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListView(
        shrinkWrap: true,
        children: widget.items.map((item) {
          return CheckboxListTile(
            title: Text(
              item,
              style: const TextStyle(fontSize: 20),
            ),
            value: checkedItems[item],
            onChanged: (bool? value) {
              setState(() {
                checkedItems[item] = value!;
              });
              widget.onItemSelected(item);
            },
          );
        }).toList(),
      ),
    );
  }
}
