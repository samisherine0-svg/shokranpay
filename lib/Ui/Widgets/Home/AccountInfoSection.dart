import 'package:flutter/material.dart';
import 'package:pioneerspay/Model/Response/HomeResponse/AccountInfoResponse.dart';
import 'package:pioneerspay/Utils/Colors/GeneralColor.dart';
import 'package:pioneerspay/Utils/Common.dart';
import 'package:pioneerspay/Utils/FontSizeFile.dart';
import 'package:pioneerspay/Utils/Language/translation_strings.dart';

class AccountInfoSection extends StatefulWidget {
  Data data;

  AccountInfoSection(this.data);

  @override
  _AccountInfoSection createState() => _AccountInfoSection(data);
}

class _AccountInfoSection extends State<AccountInfoSection> {
  Data data;

  _AccountInfoSection(this.data);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: Column(
        children: [
          Card(
            margin: const EdgeInsets.fromLTRB(0, 10, 0, 5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Container(
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                    child: Image.asset(
                      'assets/images/user.png',
                      width: 100,
                      height: 100,
                    ),
                  ),
                  Text(
                    "${data.firstName!} ${data.lastName!}",
                    style: TextStyle(
                      color: GeneralColor.black,
                      fontSize: FontSizeFile.m_size,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  // Text(
                  //   "${data.role!}",
                  //   style: TextStyle(
                  //     color: GeneralColor.black,
                  //     fontSize: FontSizeFile.xs_size,
                  //     fontWeight: FontWeight.w700,
                  //   ),
                  // ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 15, 0, 0),

                  ),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Image.asset(
                          'assets/images/email.png',
                          width: 25,
                          height: 25,
                          color: GeneralColor.greyText,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              Translations.of(context)!.email,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: GeneralColor.greyText,
                                  fontWeight: FontWeight.w500,
                                  fontSize: FontSizeFile.s_size),
                            ),
                            Text(
                              data.email!,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: GeneralColor.greyText,
                                  fontWeight: FontWeight.w700,
                                  fontSize: FontSizeFile.s_size),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: Divider(
                      height: 1,
                      color: GeneralColor.wGrey,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Image.asset(
                          'assets/images/mobile.png',
                          width: 25,
                          height: 25,
                          color: GeneralColor.greyText,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              Translations.of(context)!.phoneNum,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: GeneralColor.greyText,
                                  fontWeight: FontWeight.w500,
                                  fontSize: FontSizeFile.s_size),
                            ),
                            Text(
                              data.phoneNumber!,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: GeneralColor.greyText,
                                  fontWeight: FontWeight.w700,
                                  fontSize: FontSizeFile.s_size),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: Divider(
                      height: 1,
                      color: GeneralColor.wGrey,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Image.asset(
                          'assets/images/id.png',
                          width: 25,
                          height: 25,
                          color: GeneralColor.greyText,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              Translations.of(context)!.userCode,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: GeneralColor.greyText,
                                  fontWeight: FontWeight.w500,
                                  fontSize: FontSizeFile.s_size),
                            ),
                            Text(
                              data.userCode.toString(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: GeneralColor.greyText,
                                  fontWeight: FontWeight.w700,
                                  fontSize: FontSizeFile.s_size),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: Divider(
                      height: 1,
                      color: GeneralColor.wGrey,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Image.asset(
                          'assets/images/creditservices.png',
                          width: 25,
                          height: 25,
                          color: GeneralColor.greyText,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              Translations.of(context)!.serviceCredit,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: GeneralColor.greyText,
                                  fontWeight: FontWeight.w500,
                                  fontSize: FontSizeFile.s_size),
                            ),
                            Text(
                              data.serviceCredit.toString(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: GeneralColor.greyText,
                                  fontWeight: FontWeight.w700,
                                  fontSize: FontSizeFile.s_size),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: Divider(
                      height: 1,
                      color: GeneralColor.wGrey,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Image.asset(
                          'assets/images/creditcash.png',
                          width: 25,
                          height: 25,
                          color: GeneralColor.greyText,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              Translations.of(context)!.cashCredit,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: GeneralColor.greyText,
                                  fontWeight: FontWeight.w500,
                                  fontSize: FontSizeFile.s_size),
                            ),
                            Text(
                              data.cashCredit.toString(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: GeneralColor.greyText,
                                  fontWeight: FontWeight.w700,
                                  fontSize: FontSizeFile.s_size),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
