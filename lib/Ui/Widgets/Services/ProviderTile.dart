import 'package:flutter/material.dart';
import 'package:pioneerspay/Datebase/Entity/Category.dart';
import 'package:pioneerspay/Datebase/Entity/Provider.dart';
import 'package:pioneerspay/Ui/Screens/Services/Services.dart';
import 'package:pioneerspay/Utils/AppUrl.dart';
import 'package:pioneerspay/Utils/Colors/GeneralColor.dart';
import 'package:pioneerspay/Utils/FontSizeFile.dart';

class ProviderTile extends StatefulWidget {
  Provider provider;
  String categoryID;
  String categoryName;

  ProviderTile(this.provider, this.categoryID, this.categoryName);

  @override
  _ProviderTile createState() =>
      _ProviderTile(provider, categoryID, categoryName);
}

class _ProviderTile extends State<ProviderTile> {
  Provider provider;
  String categoryID;
  String categoryName;

  _ProviderTile(this.provider, this.categoryID, this.categoryName);

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
                    "https://${AppUrl.AppDomain}${provider.icon}",
                    fit: BoxFit.cover,
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
                      provider.nameAr,
                      style: TextStyle(
                          color: GeneralColor.black,
                          fontSize: FontSizeFile.s_size,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
            )),

        onTap: () {

          print("https://${AppUrl.AppDomain}${provider.icon}");
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      Services(
                          provider.id.toString(), provider.nameAr, categoryID,
                          categoryName)));
        },
      ),
    );
  }
}
