import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pioneerspay/Model/Response/ReportsResponse/DailyCredit/DailyCreditResponse.dart';
import 'package:pioneerspay/Ui/Screens/Reports/ReportsCategory.dart';
import 'package:pioneerspay/Ui/Utils/AppBarCustom.dart';
import 'package:pioneerspay/Ui/Utils/GeneralInputField.dart';
import 'package:pioneerspay/Ui/Utils/RoundedButton.dart';
import 'package:pioneerspay/Ui/Widgets/Reports/DailyCreditSection.dart';
import 'package:pioneerspay/Utils/Colors/GeneralColor.dart';
import 'package:pioneerspay/Utils/FontSizeFile.dart';
import 'package:pioneerspay/Utils/Language/translation_strings.dart';

import '../../../../Cubit/ReportsCubit/ReportsCubit.dart';
import '../../../../Model/Body/ReportsBody/DailyCreditBody.dart';
import '../../../Utils/NetworkErrorFullPage.dart';
import '../../../Utils/ProgressWidget.dart';
import '../../../Utils/UtilsFunctions.dart';

class DailyCreditResult extends StatefulWidget {
  DailyCreditBody dailyCreditBody;

  DailyCreditResult(this.dailyCreditBody);

  @override
  _DailyCreditResult createState() => _DailyCreditResult(dailyCreditBody );
}

class _DailyCreditResult extends State<DailyCreditResult> {
  DailyCreditBody dailyCreditBody;

  _DailyCreditResult(this.dailyCreditBody);

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    double marginTop = mediaQuery.padding.top;
    return Scaffold(
      backgroundColor: GeneralColor.white,
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0, marginTop, 0, 10),
            child: AppBarCustom(
              Translations.of(context)!.dailyCredit,
              () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ReportsCategory()));
              },
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: BlocProvider(
                create: (_) => ReportsCubit()..getDailyCredit(context,dailyCreditBody),
                child: BlocConsumer<ReportsCubit, ReportsState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    if (state is DailyCreditLoadState) {
                      return ProgressWidget();
                    } else if (state is DailyCreditSuccessState) {
                      return DailyCreditSection(state.dailyCreditResponse.data!);
                    } else if (state is DailyCreditErrorState) {
                      UtilsFunctions.createToast(state.message);
                      return NetworkErrorFullPage();
                    } else {
                      return Container();
                    }
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

}
