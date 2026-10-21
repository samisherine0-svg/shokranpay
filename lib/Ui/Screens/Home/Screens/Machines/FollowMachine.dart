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
import 'FollowMachineResults.dart';

class FollowMachine extends StatefulWidget {
  @override
  _FollowMachine createState() => _FollowMachine();
}

class _FollowMachine extends State<FollowMachine> {
  MandoubAssignMachines? machines;
  List<Map<String, dynamic>> machineStatus = [
    {"id": "1", "name": "معلقة"},
    {"id": "2", "name": "تم التسليم"},
  ];
  String dropDownType = '';
  String dropDownTypeId = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
                child: Column(
                  children: [
                    Column(
                      children: [
                        Container(
                          width: screenWidth,
                          child: Text(
                            "حالة المكينة",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: FontSizeFile.s_size,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          margin: const EdgeInsets.fromLTRB(2, 0, 2, 5),
                        ),
                        Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: GeneralColor.white,
                            borderRadius: BorderRadius.circular(10.0),
                            shape: BoxShape.rectangle,
                            border: Border.all(
                                width: 2, color: GeneralColor.secondColor),
                          ),
                          child: Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: DropdownButton(
                                  underline: const SizedBox(),
                                  hint: Center(
                                    child: Text(
                                      dropDownType,
                                      style: TextStyle(
                                          color: GeneralColor.black,
                                          fontSize: FontSizeFile.xs_size,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  isExpanded: true,
                                  items: machineStatus.map((data) {
                                    return DropdownMenuItem(
                                      onTap: () {
                                        setState(() {
                                          dropDownType = data["name"];
                                        });
                                      },
                                      child: Center(
                                          child: Text(
                                        data["name"],
                                      )),
                                      value: data["id"],
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      dropDownTypeId = value.toString();
                                    });
                                  }),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                          child: RoundedButton(
                            "بحث",
                            () {
                              getAllMachines();
                            },
                            GeneralColor.appColor,
                            GeneralColor.white,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Expanded(child: child),
        ],
      ),
    );
  }

  getAllMachines() {
    if (dropDownTypeId.isEmpty) {
      UtilsFunctions.createToast("أختر حالة المكينة");
    } else {
      Progress.show(context);
      getMandoubAssignMachineApi(dropDownTypeId).then((value) {
        Progress.dismiss();
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => FollowMachineResults(
                      machines: value,
                      id: dropDownTypeId,
                    )));
      }).catchError((onError) {
        Progress.dismiss();
        UtilsFunctions.createToast(
            Translations.of(context)!.errorPleaseTryAgain);
        print(onError);
      });
    }
  }
}
