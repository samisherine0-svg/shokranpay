
import 'package:flutter/material.dart';
import 'package:pioneerspay/Utils/Colors/GeneralColor.dart';
import 'package:pioneerspay/Utils/FontSizeFile.dart';

import '../../Utils/Language/translation_strings.dart';

class NetworkErrorFullPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Center(
        child: Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height -200,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                Translations.of(context)!.errorPleaseTryAgain,
                style: TextStyle(
                    color: GeneralColor.black,
                    fontSize: FontSizeFile.m_size,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.0),
              ),
            ],
          ),
        ),
      );
}
