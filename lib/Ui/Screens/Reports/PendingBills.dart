import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pioneerspay/Cubit/ReportsCubit/ReportsCubit.dart';
import 'package:pioneerspay/Model/Response/ReportsResponse/PendingBillsResponse.dart';
import 'package:pioneerspay/Ui/Screens/Reports/ReportsCategory.dart';
import 'package:pioneerspay/Ui/Widgets/Reports/PendingReportTile.dart';
import 'package:pioneerspay/Ui/Utils/AppBarCustom.dart';
import 'package:pioneerspay/Ui/Utils/NetworkErrorFullPage.dart';
import 'package:pioneerspay/Ui/Utils/ProgressWidget.dart';
import 'package:pioneerspay/Ui/Utils/UtilsFunctions.dart';
import 'package:pioneerspay/Utils/Colors/GeneralColor.dart';
import 'package:pioneerspay/Utils/Language/translation_strings.dart';

class PendingBills extends StatefulWidget {
  @override
  _PendingBills createState() => _PendingBills();
}

class _PendingBills extends State<PendingBills> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    double marginTop = mediaQuery.padding.top;
    return Scaffold(
      backgroundColor: GeneralColor.wGrey,
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0, marginTop, 0, 10),
            child: AppBarCustom(
              Translations.of(context)!.pendingBills,
              () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ReportsCategory()));
              },
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: BlocProvider(
                create: (_) => ReportsCubit()..getPendingBills(context),
                child: BlocConsumer<ReportsCubit, ReportsState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    if (state is PendingBillsLoadState) {
                      return ProgressWidget();
                    } else if (state is PendingBillsSuccessState) {
                      return setBills(state.pendingBillsResponse.data!);
                    } else if (state is PendingBillsErrorState) {
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
  setBills(List<Data> data) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: data.length,
        itemBuilder: (context, index) => PendingBillTile(data[index]),
      ),
    );
  }
}

