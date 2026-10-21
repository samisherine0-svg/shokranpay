import 'package:flutter/material.dart';
import 'package:pioneerspay/Datebase/Entity/Category.dart';
import 'package:pioneerspay/Datebase/Entity/Provider.dart';
import 'package:pioneerspay/Ui/Screens/Services/Providers.dart';
import 'package:pioneerspay/Utils/AppUrl.dart';
import 'package:pioneerspay/Utils/Colors/GeneralColor.dart';
import 'package:pioneerspay/Utils/FontSizeFile.dart';

class CategoryTile extends StatefulWidget {
  Category category;

  CategoryTile(this.category);

  @override
  _CategoryTile createState() => _CategoryTile(category);
}

class _CategoryTile extends State<CategoryTile> {
  Category category;

  _CategoryTile(this.category);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            margin: const EdgeInsets.fromLTRB(20, 10, 20, 5),
            child: Container(
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
              child: Row(
                children: [
                  Image.network(
                    "https://${AppUrl.AppDomain}${category.icon}",
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
                      category.nameAr,
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
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      Providers(category.id.toString(), category.nameAr)));
        });
  }
}
