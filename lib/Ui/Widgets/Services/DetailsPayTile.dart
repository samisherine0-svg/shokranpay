import 'package:pioneerspay/Model/General/DetailsPayModel.dart';
import 'package:pioneerspay/Utils/Colors/GeneralColor.dart';
import 'package:pioneerspay/Utils/FontSizeFile.dart';
import 'package:pioneerspay/Utils/Language/translation_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailsPayTile extends StatefulWidget {
  DetailsPayModel detailsPayModel;

  DetailsPayTile(this.detailsPayModel);

  @override
  _DetailsPayTile createState() => _DetailsPayTile(detailsPayModel);
}

class _DetailsPayTile extends State<DetailsPayTile> {
  DetailsPayModel detailsPayModel;

  _DetailsPayTile(this.detailsPayModel);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    // TODO: implement build
    return Container(
      margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: (screenWidth / 2) - 30,
            child: Text(
              detailsPayModel.key!,
              style: TextStyle(
                  color: GeneralColor.black,
                  fontWeight: FontWeight.w700,
                  fontSize: FontSizeFile.s_size),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(5, 0, 5, 0),
            child: Text(
              ":",
              style: TextStyle(
                  color: GeneralColor.black,
                  fontWeight: FontWeight.w700,
                  fontSize: FontSizeFile.s_size),
            ),
          ),
          Container(
            width: (screenWidth / 2) - 70,
            child: Text(
              detailsPayModel.value!,
              style: TextStyle(
                  color: GeneralColor.black,
                  fontWeight: FontWeight.w700,
                  fontSize: FontSizeFile.s_size),
            ),
          ),
        ],
      ),
    );
  }
}
