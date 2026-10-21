import 'package:flutter/material.dart';
import 'package:pioneerspay/Utils/Colors/GeneralColor.dart';
import 'package:pioneerspay/Utils/FontSizeFile.dart';
import 'package:pioneerspay/Utils/Language/translation_strings.dart';

class RoundedPasswordField extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final TextEditingController controller;

  const RoundedPasswordField({
    required this.onChanged,
    required this.controller,
  });

  @override
  _RoundedPasswordFieldState createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
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
          obscureText: _obscureText,
          onChanged: widget.onChanged,
          cursorColor: GeneralColor.greyText,
          controller: widget.controller,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: Translations.of(context)!.password,
            hintStyle: TextStyle(
                color: GeneralColor.appColor,
                fontSize: FontSizeFile.xs_size,
                fontWeight: FontWeight.bold),
            prefixIcon: Icon(
              Icons.lock,
              color: GeneralColor.appColor,
            ),
            suffixIcon: InkWell(
              onTap: () {
                _toggle();
              },
              child: Padding(
                  padding: EdgeInsets.only(top: 1.0),
                  child: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                  )),
            ),
          ),
        ),
      ),
    );
  }

  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
}
