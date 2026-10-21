import 'package:pioneerspay/Utils/Colors/GeneralColor.dart';
import 'package:pioneerspay/Utils/Language/translation_strings.dart';
import 'package:flutter/material.dart';
import 'package:ndialog/ndialog.dart';
class Progress {
  static ProgressDialog? pr;

  static Future<void> show(BuildContext context) async {
    pr = ProgressDialog(
      context,
      blur: 0,
      dismissable: false,
      dialogTransitionType: DialogTransitionType.Shrink,
      message: const Text("Message"),
      onDismiss: () {
        print("Do something onDismiss");
      },
    );
    pr?.setLoadingWidget(CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation(GeneralColor.appColor),
    ));
    pr?.setMessage(Text(Translations.of(context)!.waitMoments));
    pr?.show();
  }

  static void dismiss() {
    pr?.dismiss();
  }
}
