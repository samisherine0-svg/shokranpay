import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pioneerspay/Cubit/ServicesCubit/ServicesCubit.dart';
import 'package:pioneerspay/Datebase/Entity/Category.dart';
import 'package:pioneerspay/Ui/Screens/Services/ServicesEnquiry.dart';
import 'package:pioneerspay/Datebase/Entity/Service.dart';
import 'package:pioneerspay/Model/Response/ServicesResponse/ServicesListResponse.dart';
import 'package:pioneerspay/Utils/AppUrl.dart';
import 'package:pioneerspay/Utils/Colors/GeneralColor.dart';
import 'package:pioneerspay/Utils/FontSizeFile.dart';

class ServiceTile extends StatefulWidget {
  Service service;
  String providerID;
  String providerName;
  String categoryID;
  String categoryName;

  ServiceTile(this.service, this.providerID, this.providerName,this.categoryID,this.categoryName);

  @override
  _ServiceTile createState() => _ServiceTile(service, providerID,providerName,categoryID,categoryName);
}

class _ServiceTile extends State<ServiceTile> {
  Service service;
  String providerID;
  String providerName;
  String categoryID;
  String categoryName;

  _ServiceTile(this.service, this.providerID, this.providerName,this.categoryID,this.categoryName);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 10, 20, 5),
      child: InkWell(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
            child: Container(
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
              child: Row(
                children: [
                  Image.network(
                    "https://${AppUrl.AppDomain}${service.icon}",
                    height: 30,
                    width: 30,
                    errorBuilder: (context, error, stackTrace) {
                      // print(error); //do something
                      return const SizedBox(
                        height: 30,
                        width: 30,
                      );
                    },

                    // width: screenWidth.width,
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                    child: Text(
                      service.nameAr,
                      style: TextStyle(
                          color: GeneralColor.black,
                          fontSize: FontSizeFile.s_size,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
            )
        ),
        onTap: () {
          BlocProvider.of<ServicesCubit>(context).checkDirectPay(
              service.id.toString(),
              service.nameAr,
              service.currentServiceProviderId.toString(),
              providerID,providerName,categoryID,categoryName,service.paymentType,
              context);
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (context) => ServicesEnquiry(
          //             service.id.toString(), service.nameAr, service.currentServiceProviderId.toString())));
        },
      ),
    );
  }
}
