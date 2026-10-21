import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../Utils/AppUrl.dart';
import '../../../../Utils/Colors/GeneralColor.dart';
import '../../../Utils/AppBarCustom.dart';

class ViewImage extends StatefulWidget {
  String link;

  ViewImage(this.link);

  @override
  _ViewImage createState() => _ViewImage(link);
}

class _ViewImage extends State<ViewImage> {
  String link;

  _ViewImage(this.link);

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
              "الايصال",
                  () {
                Navigator.pop(context);
              },
            ),
          ),
          Expanded(
            child: CachedNetworkImage(
              imageUrl: "https://${AppUrl.AppDomain}${link}",
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              placeholder: (context, url) =>
                  SizedBox(
                      height: 30,
                      width: 30,
                      child: Center(child: CircularProgressIndicator())),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          // Expanded(child: child),
        ],
      ),
    );
  }
}
