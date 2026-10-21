import 'package:flutter/material.dart';
import 'package:pioneerspay/Ui/Screens/Home/Screens/Merchant/merchantDetails.dart';
import 'package:pioneerspay/Ui/Utils/AppBarCustom.dart';
import 'package:pioneerspay/Utils/Colors/GeneralColor.dart';
import 'package:pioneerspay/Utils/FontSizeFile.dart';
import 'package:pioneerspay/Utils/Language/translation_strings.dart';
import '../../../../../Model/Body/HomeBody/merchant_list_response.dart';
import '../../../../../Repositry/HomeRepositry.dart';

class MarchantList extends StatefulWidget {
  @override
  _MarchantList createState() => _MarchantList();
}

class _MarchantList extends State<MarchantList> {
  MerchantListResponse? merchantListResponse;
  List<Datum> searchedMerchantList = [];
  List<Datum> merchantList = [];
  TextEditingController userName = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMerchantList();
  }

  searchByMerchant(String merchantName) {
    if (double.tryParse(merchantName) != null) {
      merchantName.isNotEmpty
          ? searchedMerchantList = merchantList
              .where((item) => "${item.userCode}"
                  .toLowerCase()
                  .contains(merchantName.toLowerCase()))
              .toList()
          : searchedMerchantList = merchantList;
      setState(() {});
    } else {
      merchantName.isNotEmpty
          ? searchedMerchantList = merchantList
              .where((item) => "${item.firstName} ${item.lastName}"
                  .toLowerCase()
                  .contains(merchantName.toLowerCase()))
              .toList()
          : searchedMerchantList = merchantList;
      setState(() {});
    }
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
              "قائمة العملاء",
              () {
                Navigator.pop(context);
              },
            ),
          ),

          merchantListResponse == null
              ? SizedBox()
              :  Container(
            margin: const EdgeInsets.fromLTRB(10, 4, 10, 4),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(12))),
            child: TextField(
                onChanged: (v) {
                  searchByMerchant(v);
                },
                controller: userName,
                decoration: InputDecoration(
                  hintText: "اسم التاجر او كود التاجر",
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: GeneralColor.appColor),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(12))),
                ),
                textAlign: TextAlign.start,
                style: const TextStyle(color: Colors.black)),
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
                          itemCount: searchedMerchantList.length,
                          itemBuilder: (context, index) => InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MarchantDetails(
                                            data: searchedMerchantList[index],
                                          )));
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
                                              fontSize: FontSizeFile.xs_size,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          SizedBox(
                                            width: (screenWidth / 2) - 40,
                                            child: Text(
                                              "${searchedMerchantList[index].firstName} ${searchedMerchantList[index].lastName}"
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
                                      margin:
                                          const EdgeInsets.fromLTRB(0, 0, 0, 5),
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: (screenWidth / 2) - 40,
                                            child: Text(
                                              Translations.of(context)!
                                                  .merchantCode,
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
                                              searchedMerchantList[index]
                                                  .userCode
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
                                      margin:
                                          const EdgeInsets.fromLTRB(0, 0, 0, 5),
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: (screenWidth / 2) - 40,
                                            child: Text(
                                              Translations.of(context)!
                                                  .serviceCredit,
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
                                              searchedMerchantList[index]
                                                  .serviceCredit
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
                                      margin:
                                          const EdgeInsets.fromLTRB(0, 0, 0, 5),
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: (screenWidth / 2) - 40,
                                            child: Text(
                                              Translations.of(context)!
                                                  .cashCredit,
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
                                              searchedMerchantList[index]
                                                  .cashCredit
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
        searchedMerchantList = merchantListResponse!.data;
        merchantList = merchantListResponse!.data;
      });
    }).catchError((onError) {
      getMerchantList();
      print(onError);
    });
  }
}
