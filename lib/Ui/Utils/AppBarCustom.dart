import 'package:flutter/material.dart';
import 'package:pioneerspay/Utils/Colors/GeneralColor.dart';
import 'package:pioneerspay/Utils/FontSizeFile.dart';

class AppBarCustom extends StatefulWidget {
  String title;
  Function() press;


  AppBarCustom(this.title,this.press);

  @override
  _AppBarCustomState createState() => _AppBarCustomState(title,press);
}

class _AppBarCustomState extends State<AppBarCustom> {
  String title;
  Function() press;

  _AppBarCustomState(this.title,this.press);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 60,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: GeneralColor.appColor,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(15.0),
          bottomRight: Radius.circular(15.0),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            onPressed: press,
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Text(
              title,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: FontSizeFile.m_size,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
