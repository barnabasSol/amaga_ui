import 'package:flutter/material.dart';

class CustomDropDown extends StatefulWidget {
  final ValueChanged<String> onSelected;
  final List<String> items;
  final double height;
  final Color borderColor;
  const CustomDropDown(
      {Key? key,
      required this.onSelected,
      required this.items,
      this.height = 60,
      this.borderColor = const Color.fromARGB(255, 168, 167, 166) })
      : super(key: key);

  @override
  State<CustomDropDown> createState() => CustomDropDownState();
}

class CustomDropDownState extends State<CustomDropDown> {
  String dropdownValue = 'Gas Type';

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: widget.borderColor),
        borderRadius: BorderRadius.circular(13),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          hint: const Text(
            "Gas Type",
            style: TextStyle(color: Colors.black),
          ),
          value: dropdownValue,
          isExpanded: true,
          onChanged: (String? newValue) {
            if (newValue != 'Gas Type') {
              setState(() {
                dropdownValue = newValue!;
              });
              widget.onSelected(newValue!);
            }
          },
          items: <DropdownMenuItem<String>>[
            const DropdownMenuItem<String>(
              value: 'Gas Type',
              enabled: false,
              child: Text(
                'Gas Type',
                style: TextStyle(color: Color.fromARGB(255, 97, 97, 97)),
              ),
            ),
            ...widget.items.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
