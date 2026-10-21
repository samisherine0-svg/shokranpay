import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pioneerspay/Cubit/HomeCubit/HomeCubit.dart';
import 'package:pioneerspay/Datebase/Entity/Category.dart';
import 'package:pioneerspay/Ui/Screens/Home/Menu.dart';
import 'package:pioneerspay/Ui/Screens/Home/Screens/Merchant/marchantList.dart';
import 'package:pioneerspay/Ui/Screens/Home/Screens/notifications/notifications_screen.dart';
import 'package:pioneerspay/Ui/Screens/SellersServices/CreditTransfer.dart';
import 'package:pioneerspay/Ui/Screens/Settings/SettingsCategory.dart';
import 'package:pioneerspay/Ui/Utils/NetworkErrorFullPage.dart';
import 'package:pioneerspay/Ui/Utils/ProgressWidget.dart';
import 'package:pioneerspay/Ui/Utils/UtilsFunctions.dart';
import 'package:pioneerspay/Ui/Widgets/Home/CategoryTile.dart';
import 'package:pioneerspay/Utils/Colors/GeneralColor.dart';
import 'package:pioneerspay/Ui/Utils/Progress.dart';
import 'package:pioneerspay/Utils/FontSizeFile.dart';
import 'package:pioneerspay/Utils/Language/translation_strings.dart';

import '../../../Utils/Common.dart';
import '../Authoriation/Login.dart';
import '../Reports/CreditMovementsReport/CreditMovementsReport.dart';
import '../SellersServices/CreateNewAgentUnderAgent.dart';
import 'Screens/Machines/AddMachineToReseller.dart';
import 'Screens/Machines/FollowMachine.dart';
import 'Screens/Merchant/followMerchantBalances.dart';
import 'Screens/followDeposit.dart';
import 'Screens/raiseDeposit.dart';

class Home extends StatefulWidget {
  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey(); // Create a key

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    double marginTop = mediaQuery.padding.top;
    return Scaffold(
      key: scaffoldKey,
      // drawer: Drawer(
      //   child: Menu(),
      // ),
      backgroundColor: GeneralColor.wGrey,
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0, marginTop, 0, 10),
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: GeneralColor.appColor,
              // borderRadius: const BorderRadius.only(
              //   bottomLeft: Radius.circular(15.0),
              //   bottomRight: Radius.circular(15.0),
              // ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Row(
                children: [
                  BlocProvider(
                    create: (_) => HomeCubit()..getBalance(context),
                    child: BlocConsumer<HomeCubit, HomeState>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        if (state is BalanceLoadingState) {
                          return Expanded(
                              child: Center(
                                  child: CircularProgressIndicator(
                            color: Colors.white,
                          )));
                        } else if (state is BalanceSuccessState) {
                          return Expanded(
                            child: Row(
                              children: [
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      BlocProvider.of<HomeCubit>(context)
                                          .getBalance(context);
                                    },
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              Translations.of(context)!
                                                  .serviceCredit,
                                              style: TextStyle(
                                                  color: GeneralColor.white,
                                                  fontSize: FontSizeFile.s_size,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            Text(
                                              " : ",
                                              style: TextStyle(
                                                  color: GeneralColor.white,
                                                  fontSize: FontSizeFile.s_size,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            Text(
                                              state.balanceResponse.data!
                                                  .serviceCredit
                                                  .toString(),
                                              style: TextStyle(
                                                color: GeneralColor.white,
                                                fontSize: FontSizeFile.s_size,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              Translations.of(context)!
                                                  .cashCredit,
                                              style: TextStyle(
                                                  color: GeneralColor.white,
                                                  fontSize: FontSizeFile.s_size,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            Text(
                                              " : ",
                                              style: TextStyle(
                                                  color: GeneralColor.white,
                                                  fontSize: FontSizeFile.s_size,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            Text(
                                              state.balanceResponse.data!
                                                  .cashCredit
                                                  .toString(),
                                              style: TextStyle(
                                                color: GeneralColor.white,
                                                fontSize: FontSizeFile.s_size,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        } else {
                          return Expanded(
                            child: Center(
                              child: InkWell(
                                onTap: () {
                                  BlocProvider.of<HomeCubit>(context)
                                      .getBalance(context);
                                },
                                child: SizedBox(
                                  child: Icon(
                                    Icons.refresh,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                ),
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                  Container(
                    // margin: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NotificationsScreen()));
                      },
                      icon: const Icon(
                        Icons.notifications_active_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        homeTail(
                            "assets/images/addMarchant.png", "انشاء حساب جديد",
                            () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      CreateNewAgentUnderAgent()));
                        }),
                        homeTail("assets/images/marchant.png", "قائمة العملاء",
                            () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MarchantList()));
                        }),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        homeTail("assets/images/money.png", "تحويل رصيد", () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TransferCredit(
                                        userCode: '',
                                        userName: '',
                                        shopName: '',
                                      )));
                        }),
                        homeTail("assets/images/reports.png",
                            Translations.of(context)!.transactionsReports, () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CreditMovementsReport(
                                        userCode: '',
                                      )));
                        }),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        homeTail("assets/images/uploadMoney.png",
                            Translations.of(context)!.raiseDeposit, () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>  UploadReceipt()));
                        }),
                        homeTail("assets/images/followMoney.png",
                            Translations.of(context)!.followDeposits, () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FollowDeposit()));
                        }),
                      ],
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     homeTail("assets/images/pos.png", "تسليم المكينة للتاجر",
                    //             () {
                    //           Navigator.push(
                    //               context,
                    //               MaterialPageRoute(
                    //                   builder: (context) => const AddMachineToReseller(
                    //                     userCode: '',
                    //                     userName: '',
                    //                   )));
                    //         }),
                    //     homeTail(
                    //         "assets/images/followPos.png", "متابعة تسليم المكينات",
                    //             () {
                    //           Navigator.push(
                    //               context,
                    //               MaterialPageRoute(
                    //                   builder: (context) => FollowMachine()));
                    //         }),
                    //   ],
                    // ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        homeTail("assets/images/settings.png",
                            Translations.of(context)!.settings, () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SettingsCategory()));
                        }),
                        homeTail("assets/images/logOut.png",
                            Translations.of(context)!.logout, () {
                          Common.logout();
                          Navigator.pushAndRemoveUntil<dynamic>(
                            context,
                            MaterialPageRoute<dynamic>(
                              builder: (BuildContext context) => Login(),
                            ),
                            (route) => false,
                          );
                        }),
                      ],
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }

  Widget homeTail(image, name, goTo) {
    return InkWell(
        child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            margin: const EdgeInsets.fromLTRB(5, 10, 5, 5),
            child: Container(
              width: MediaQuery.of(context).size.width / 2 - 20,
              padding: const EdgeInsets.fromLTRB(5, 15, 5, 15),
              child: Column(
                children: [
                  Image.asset(
                    image,
                    height: 50,
                    width: 50,
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        name,
                        style: TextStyle(
                            color: GeneralColor.black,
                            fontSize: FontSizeFile.s_size,
                            fontWeight: FontWeight.w700),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            )),
        onTap: goTo);
  }
}
