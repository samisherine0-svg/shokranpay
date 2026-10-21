import 'package:flutter/material.dart';
import 'package:pioneerspay/Ui/Screens/Home/Screens/Merchant/merchantDetails.dart';
import 'package:pioneerspay/Ui/Utils/AppBarCustom.dart';
import 'package:pioneerspay/Ui/Utils/RoundedButton.dart';
import 'package:pioneerspay/Utils/Colors/GeneralColor.dart';
import 'package:pioneerspay/Utils/FontSizeFile.dart';
import 'package:pioneerspay/Utils/Language/translation_strings.dart';
import '../../../../../Model/Body/HomeBody/merchant_list_response.dart';
import '../../../../../Repositry/HomeRepositry.dart';
import '../../../Reports/CreditMovementsReport/CreditMovementsReport.dart';
import '../../../SellersServices/CreditTransfer.dart';

class FollowMerchantBalances extends StatefulWidget {
  @override
  _FollowMerchantBalances createState() => _FollowMerchantBalances();
}

class _FollowMerchantBalances extends State<FollowMerchantBalances> {
  MerchantListResponse? merchantListResponse;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMerchantList();
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
              Translations.of(context)!.followMerchantBalances,
              () {
                Navigator.pop(context);
              },
            ),
          ),
          Expanded(
            child: merchantListResponse == null
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : SingleChildScrollView(
                    physics: const ClampingScrollPhysics(),
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: MediaQuery.removePadding(
                        context: context,
                        removeTop: true,
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: merchantListResponse!.data.length,
                          itemBuilder: (context, index) => InkWell(
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => MarchantDetails()));
                            },
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
                                      margin:
                                          const EdgeInsets.fromLTRB(0, 0, 0, 5),
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: (screenWidth / 2) - 40,
                                            child: Text(
                                              "اسم التاجر",
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
                                              fontSize: FontSizeFile.m_size,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          SizedBox(
                                            width: (screenWidth / 2) - 40,
                                            child: Text(
                                              "${merchantListResponse!.data[index].firstName} ${merchantListResponse!.data[index].lastName}",
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
                                      margin:
                                          const EdgeInsets.fromLTRB(0, 0, 0, 5),
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: (screenWidth / 2) - 40,
                                            child: Text(
                                              "رقم المركز",
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
                                              fontSize: FontSizeFile.m_size,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          SizedBox(
                                            width: (screenWidth / 2) - 40,
                                            child: Text(
                                              "${merchantListResponse!.data[index].userCode}",
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
                                      margin:
                                          const EdgeInsets.fromLTRB(0, 0, 0, 5),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            width: (screenWidth / 2) - 40,
                                            child: Text(
                                              "الرصيد الحالي",
                                              style: TextStyle(
                                                  color: GeneralColor.black,
                                                  fontSize: FontSizeFile.m_size,
                                                  fontWeight: FontWeight.bold),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin:
                                          const EdgeInsets.fromLTRB(0, 0, 0, 5),
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: (screenWidth / 2) - 40,
                                            child: Text(
                                              "رصيد الكاش",
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
                                              fontSize: FontSizeFile.m_size,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          SizedBox(
                                            width: (screenWidth / 2) - 40,
                                            child: Text(
                                              "${merchantListResponse!.data[index].cashCredit}",
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
                                      margin:
                                          const EdgeInsets.fromLTRB(0, 0, 0, 5),
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: (screenWidth / 2) - 40,
                                            child: Text(
                                              "رصيد خدمات",
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
                                              fontSize: FontSizeFile.m_size,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          SizedBox(
                                            width: (screenWidth / 2) - 40,
                                            child: Text(
                                              "${merchantListResponse!.data[index].serviceCredit}",
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
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            margin: const EdgeInsets.fromLTRB(
                                                0, 20, 0, 10),
                                            child: RoundedButton(
                                              "تحويل رصيد",
                                              () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            TransferCredit(
                                                              userName:
                                                                  "${merchantListResponse!.data[index].firstName} ${merchantListResponse!.data[index].lastName}",
                                                              userCode:
                                                                  merchantListResponse!
                                                                      .data[
                                                                          index]
                                                                      .userCode
                                                                      .toString(),
                                                              shopName: merchantListResponse!
                                                                      .data[
                                                                          index]
                                                                      .ShopName ??
                                                                  "-",
                                                            )));
                                              },
                                              GeneralColor.appColor,
                                              GeneralColor.white,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Expanded(
                                          child: Container(
                                            margin: const EdgeInsets.fromLTRB(
                                                0, 20, 0, 10),
                                            child: RoundedButton(
                                              "تقريرالعمليات",
                                              () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            CreditMovementsReport(
                                                              userCode:
                                                                  merchantListResponse!
                                                                      .data[
                                                                          index]
                                                                      .userCode
                                                                      .toString(),
                                                            )));
                                              },
                                              GeneralColor.appColor,
                                              GeneralColor.white,
                                            ),
                                          ),
                                        )
                                      ],
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

  getMerchantList() {
    getMyAgentsApi().then((value) {
      setState(() {
        merchantListResponse = value;
        print(merchantListResponse!.data.length);
      });
    }).catchError((onError) {
      getMerchantList();
      print(onError);
    });
  }
}
