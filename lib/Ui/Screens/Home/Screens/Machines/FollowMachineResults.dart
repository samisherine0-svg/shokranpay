import 'package:flutter/material.dart';
import 'package:pioneerspay/Ui/Screens/Home/Screens/Merchant/merchantDetails.dart';
import 'package:pioneerspay/Ui/Utils/AppBarCustom.dart';
import 'package:pioneerspay/Ui/Utils/UtilsFunctions.dart';
import 'package:pioneerspay/Utils/Colors/GeneralColor.dart';
import 'package:pioneerspay/Utils/FontSizeFile.dart';
import 'package:pioneerspay/Utils/Language/translation_strings.dart';
import '../../../../../Model/Body/HomeBody/merchant_list_response.dart';
import '../../../../../Repositry/HomeRepositry.dart';
import '../../../../../Model/Response/HomeResponse/MandoubAssignMachines.dart';
import '../../../../Utils/Progress.dart';
import '../../../../Utils/RoundedButton.dart';
import 'FollowMachineDetails.dart';
import 'FollowMachineDetailsPending.dart';

class FollowMachineResults extends StatefulWidget {
  final MandoubAssignMachines machines;
  final String id;

  const FollowMachineResults(
      {Key? key, required this.machines, required this.id})
      : super(key: key);

  @override
  _FollowMachineResults createState() => _FollowMachineResults();
}

class _FollowMachineResults extends State<FollowMachineResults> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    double marginTop = mediaQuery.padding.top;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: GeneralColor.wGrey,
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0, marginTop, 0, 10),
            child: AppBarCustom(
              "متابعة تسليم المكينات",
              () {
                Navigator.pop(context);
              },
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Container(
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: widget.machines.data.length,
                    itemBuilder: (context, index) => InkWell(
                      onTap: () {},
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        margin: const EdgeInsets.fromLTRB(0, 10, 0, 5),
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: (screenWidth / 2) - 40,
                                      child: Text(
                                        "اسم المكينة",
                                        style: TextStyle(
                                            color: GeneralColor.black,
                                            fontSize: FontSizeFile.m_size,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Text(
                                      ":",
                                      style: TextStyle(
                                        color: GeneralColor.black,
                                        fontSize: FontSizeFile.xs_size,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(
                                      width: (screenWidth / 2) - 40,
                                      child: Text(
                                        widget.machines.data[index].machineName
                                            .toString(),
                                        style: TextStyle(
                                          color: GeneralColor.black,
                                          fontSize: FontSizeFile.m_size,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: (screenWidth / 2) - 40,
                                      child: Text(
                                        Translations.of(context)!.machineSerial,
                                        style: TextStyle(
                                            color: GeneralColor.black,
                                            fontSize: FontSizeFile.m_size,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Text(
                                      ":",
                                      style: TextStyle(
                                        color: GeneralColor.black,
                                        fontSize: FontSizeFile.xs_size,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(
                                      width: (screenWidth / 2) - 40,
                                      child: Text(
                                        widget.machines.data[index].serial
                                            .toString(),
                                        style: TextStyle(
                                          color: GeneralColor.black,
                                          fontSize: FontSizeFile.m_size,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                                child: RoundedButton(
                                  "التفاصيل",
                                  () {
                                    widget.id == "2"
                                        ? getDetails(
                                            widget.machines.data[index]
                                                .resellerId,
                                            widget.machines.data[index].serial,
                                            widget.machines.data[index]
                                                .statusName)
                                        : Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    FollowMachineDetailsPending(
                                                      data: widget
                                                          .machines.data[index],
                                                    )));
                                  },
                                  GeneralColor.appColor,
                                  GeneralColor.white,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          // Expanded(child: child),
        ],
      ),
    );
  }

  getDetails(id, serial, status) {
    Progress.show(context);
    getMachineDetailsApi(id).then((value) {
      Progress.dismiss();
      value.data.forEach((element) {
        element.serial == serial
            ? Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => FollowMachineDetails(
                          data: element,
                          status: status,
                        )))
            : null;
      });
    }).catchError((onError) {
      Progress.dismiss();
      UtilsFunctions.createToast(Translations.of(context)!.errorPleaseTryAgain);
      print(onError);
    });
  }
}
