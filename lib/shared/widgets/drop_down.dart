import 'package:flutter/material.dart';

class CustomDropDown extends StatefulWidget {
  final ValueChanged<String> onSelected;
  final List<String> items;

  const CustomDropDown(
      {Key? key, required this.onSelected, required this.items})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CustomDropDownState createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  String dropdownValue = 'Gas Type';

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromARGB(255, 168, 167, 166)),
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
