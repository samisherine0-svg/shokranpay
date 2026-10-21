import 'package:pioneerspay/Model/General/DetailsPayModel.dart';
import 'package:pioneerspay/Utils/Colors/GeneralColor.dart';
import 'package:pioneerspay/Utils/FontSizeFile.dart';
import 'package:pioneerspay/Utils/Language/translation_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailsPrintTile extends StatefulWidget {
  DetailsPayModel detailsPayModel;

  DetailsPrintTile(this.detailsPayModel);

  @override
  _DetailsPrintTile createState() => _DetailsPrintTile(detailsPayModel);
}

class _DetailsPrintTile extends State<DetailsPrintTile> {
  DetailsPayModel detailsPayModel;

  _DetailsPrintTile(this.detailsPayModel);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    // TODO: implement build
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 5),
      child: detailsPayModel.isSeperator!
          ? SizedBox(
              height: 10,
              child: Divider(
                height: 8,
                color: GeneralColor.black,
              ),
            )
          : Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  detailsPayModel.key!,
                  style: TextStyle(
                      color: GeneralColor.black,
                      fontWeight: FontWeight.w700,
                      fontSize: FontSizeFile.xs_size),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                  child: Text(
                    ":",
                    style: TextStyle(
                        color: GeneralColor.black,
                        fontWeight: FontWeight.w700,
                        fontSize: FontSizeFile.xs_size),
                  ),
                ),
                Text(
                  detailsPayModel.value!,
                  style: TextStyle(
                      color: GeneralColor.black,
                      fontWeight: FontWeight.w700,
                      fontSize: FontSizeFile.xs_size),
                ),
              ],
            ),
    );
  }
}
