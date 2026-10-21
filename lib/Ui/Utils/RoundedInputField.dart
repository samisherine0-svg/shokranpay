import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pioneerspay/Utils/Colors/GeneralColor.dart';
import 'package:pioneerspay/Utils/FontSizeFile.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final TextEditingController controller;
  final ValueChanged<String> onChanged;

  const RoundedInputField({
    required this.hintText,
    required this.controller,
    this.icon = Icons.person,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 60,
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: GeneralColor.wGrey),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Center(
        child: TextField(
          onChanged: onChanged,
          controller: controller,
          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(
              icon,
              size: 30,
              color: GeneralColor.appColor,
            ),
            hintText: hintText,
            hintStyle: TextStyle(
                color: GeneralColor.appColor,
                fontSize: FontSizeFile.xs_size,
                fontWeight: FontWeight.bold),          ),
        ),
      ),
    );
  }
}
