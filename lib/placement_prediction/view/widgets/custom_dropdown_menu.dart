import 'package:flutter/material.dart';

final _numberList = List.generate(10, (index) => index).toList();

class CustomDropdownMenu extends StatefulWidget {
  const CustomDropdownMenu({
    super.key,
    required this.controller,
    required this.onChanged,
  });
  final String? controller;
  final ValueChanged<String?> onChanged; // Function to notify the parent

  @override
  State<CustomDropdownMenu> createState() => CustomDropdownMenuState();
}

class CustomDropdownMenuState extends State<CustomDropdownMenu> {
  String? selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.controller; // Initialize from widget's controller
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.black,
          width: 2,
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          padding: EdgeInsets.symmetric(horizontal: 8),
          value: selectedValue, // Use the local state variable
          isExpanded: true,
          items: _numberList.map(_buildItemMenu).toList(),
          onChanged: (value) {
            setState(() {
              selectedValue = value;
            });
            widget.onChanged(value); // Notify the parent
          },
        ),
      ),
    );
  }
}

DropdownMenuItem<String> _buildItemMenu(int num) => DropdownMenuItem(
      value: num.toString(),
      child: Text(num.toString()),
    );
