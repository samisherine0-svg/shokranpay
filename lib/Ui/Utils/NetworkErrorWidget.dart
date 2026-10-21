import 'package:flutter/material.dart';

import '../../Utils/Language/translation_strings.dart';

class NetworkErrorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        child: Column(
          // mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(Translations.of(context)!.errorPleaseTryAgain),
          ],
        ),
      );
}
