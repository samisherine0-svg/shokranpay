import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pioneerspay/Utils/Colors/GeneralColor.dart';
import 'package:pioneerspay/Utils/FontSizeFile.dart';

class GeneralInputField extends StatelessWidget {
  final String text;
  final bool ? readOnly;
  final TextEditingController controller;
  final TextInputType textInputType;

  const GeneralInputField({
    required this.text,
    required this.controller,
    required this.textInputType,
     this.readOnly,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          width: size.width,
          child: Text(
            text,
            style: TextStyle(
              color: Colors.black,
              fontSize: FontSizeFile.s_size,
              fontWeight: FontWeight.w700,
            ),
          ),
          margin: const EdgeInsets.fromLTRB(2, 0, 2, 5),
        ),
        Container(
          height: 50,
          decoration: BoxDecoration(
            color: GeneralColor.white,
            borderRadius: BorderRadius.circular(10.0),
            shape: BoxShape.rectangle,
            border: Border.all(width: 2, color: GeneralColor.appColor),
          ),
          child: Center(
            child: TextField(
              style: TextStyle(
                  color: GeneralColor.black,
                  fontWeight: FontWeight.bold,
                  fontSize: FontSizeFile.l_size),
              textAlign: TextAlign.center,
              controller: controller,
              keyboardType: textInputType,
              readOnly: readOnly == null ? false : readOnly!,
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
