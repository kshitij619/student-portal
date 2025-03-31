import 'package:flutter/material.dart';
import 'package:mini_project_sem_6/placement_prediction/view_model/prediction_view_model.dart';
import 'package:provider/provider.dart';

final numberList = List.generate(10, (index) => index).toList();

class CustomDropdownMenu extends StatefulWidget {
  const CustomDropdownMenu({
    super.key,
    required this.controller,
  });
  final String? controller;
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
          items: numberList.map(buildItemMenu).toList(),
          onChanged: (value) {
            setState(() {
              selectedValue = value;
            });
          },
        ),
      ),
    );
  }
}

DropdownMenuItem<String> buildItemMenu(int num) => DropdownMenuItem(
      value: num.toString(),
      child: Text(num.toString()),
    );


/*
class CustomDropdownMenuState extends State<CustomDropdownMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.black,
            width: 2,
          )),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          padding: EdgeInsets.symmetric(horizontal: 8),
          value: controller,
          isExpanded: true,
          items: numberList.map(buildItemMenu).toList(),
          onChanged: (value) => setState(
            () => controller = value,
          ),
        ),
      ),
    );
  }
}

*/