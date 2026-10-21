import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../Model/Response/HomeResponse/NotificationsResponse.dart';
import '../../../../../Repositry/HomeRepositry.dart';
import '../../../../../Utils/Colors/GeneralColor.dart';
import '../../../../../Utils/FontSizeFile.dart';
import '../../../../../Utils/Language/translation_strings.dart';
import '../../../../Utils/AppBarCustom.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  NotificationsResponse? notificationsResponse;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNotificationsList();
  }

  // DateTime getDateTime(index) {
  // String date=  notificationsResponse!.data[index].createdDate.date.split('-').reversed.join();
  // String time=  notificationsResponse!.data[index].createdDate.time.split(':').reversed.join();
  //   var newDate = new DateTime(int.parse(date.substring(0,4)), int.parse(date.substring(4,6)),int.parse(date.substring(6,8)) , int.parse(time.substring(0,2)) -1, int.parse(time.substring(2,4)),int.parse(time.substring(4,6)));
  //
  //   print(newDate.toString());
  //   return newDate;
  // }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    double marginTop = mediaQuery.padding.top;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: GeneralColor.white,
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0, marginTop, 0, 10),
            child: AppBarCustom(
              Translations.of(context)!.notifications,
              () {
                Navigator.pop(context);
              },
            ),
          ),
          Expanded(
            child: notificationsResponse == null
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
                          itemCount: notificationsResponse!.data.length,
                          itemBuilder: (context, index) => Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            margin: const EdgeInsets.fromLTRB(0, 10, 0, 5),
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.notifications,
                                    color: Colors.orange,
                                    size: 30,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                notificationsResponse!
                                                    .data[index].subject,
                                                style: TextStyle(
                                                    color: GeneralColor.black,
                                                    fontSize:
                                                        FontSizeFile.m_size,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                textAlign: TextAlign.start,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                notificationsResponse!
                                                    .data[index].body,
                                                style: TextStyle(
                                                    color: GeneralColor.black,
                                                    fontSize:
                                                        FontSizeFile.m_size,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                textAlign: TextAlign.start,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          "${notificationsResponse!.data[index].createdDate.time} ${notificationsResponse!.data[index].createdDate.date}",
                                          style: const TextStyle(
                                              color: Colors.red,
                                              fontWeight: FontWeight.normal,
                                              fontSize: 16),
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
          // Expanded(child: child),
        ],
      ),
    );
  }

  getNotificationsList() {
    getNotificationsApi().then((value) {
      setState(() {
        notificationsResponse = value;
        print(notificationsResponse!.data.length);
      });
    }).catchError((onError) {
      getNotificationsList();
      print(onError);
    });
  }
}
