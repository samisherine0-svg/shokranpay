import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pioneerspay/Cubit/HomeCubit/HomeCubit.dart';
import 'package:pioneerspay/Ui/Screens/Home/Home.dart';
import 'package:pioneerspay/Ui/Widgets/Home/AccountInfoSection.dart';
import 'package:pioneerspay/Ui/Utils/AppBarCustom.dart';
import 'package:pioneerspay/Ui/Utils/NetworkErrorFullPage.dart';
import 'package:pioneerspay/Ui/Utils/ProgressWidget.dart';
import 'package:pioneerspay/Ui/Utils/UtilsFunctions.dart';
import 'package:pioneerspay/Utils/Colors/GeneralColor.dart';
import 'package:pioneerspay/Utils/Language/translation_strings.dart';

class PersonalProfile extends StatefulWidget {
  @override
  _PersonalProfile createState() => _PersonalProfile();
}

class _PersonalProfile extends State<PersonalProfile> {
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
              Translations.of(context)!.personalProfile,
              () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Home()));
              },
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: BlocProvider(
                create: (_) => HomeCubit()..getAccountInfo(context),
                child: BlocConsumer<HomeCubit, HomeState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    if (state is AccountInfoLoadState) {
                      return ProgressWidget();
                    } else if (state is AccountInfoSuccessState) {
                      return AccountInfoSection(state.accountInfo.data!);
                    } else if (state is AccountInfoErrorState) {
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
