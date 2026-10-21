
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pioneerspay/Utils/FontSizeFile.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function() press;
  final Color color, textColor;

  const RoundedButton(this.text, this.press, this.color, this.textColor)
      : super();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      // padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
      child: InkWell(
        child: Container(
          height: 45,
          width: size.width,
          decoration: BoxDecoration(
            color:color,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: press,
              child: Center(
                child: Text(text,
                    style: TextStyle(
                        color:textColor,
                        fontSize: FontSizeFile.s_size,
                        fontWeight: FontWeight.w700,
                        )),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
