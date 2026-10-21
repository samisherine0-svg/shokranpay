import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pioneerspay/Cubit/ServicesCubit/ServicesCubit.dart';
import 'package:pioneerspay/Datebase/Entity/Provider.dart';
import 'package:pioneerspay/Ui/Screens/Home/Home.dart';
import 'package:pioneerspay/Ui/Utils/AppBarCustom.dart';
import 'package:pioneerspay/Ui/Utils/NetworkErrorFullPage.dart';
import 'package:pioneerspay/Ui/Utils/UtilsFunctions.dart';
import 'package:pioneerspay/Utils/Colors/GeneralColor.dart';
import 'package:pioneerspay/Ui/Widgets/Services/ProviderTile.dart';

class Providers extends StatefulWidget {
  String categoryID;
  String categoryName;

  Providers(this.categoryID, this.categoryName);

  @override
  _Providers createState() => _Providers(categoryID, categoryName);
}

class _Providers extends State<Providers> {
  String categoryID;
  String categoryName;

  _Providers(this.categoryID, this.categoryName);

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    double marginTop = mediaQuery.padding.top;
    return Scaffold(
      backgroundColor: GeneralColor.wGrey,
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0, marginTop, 0, 10),
            child: AppBarCustom(categoryName,
                  () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Home()));
              },),
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: BlocProvider(
                create: (_) =>
                    ServicesCubit()..getLocalProviders(categoryID, context),
                child: BlocConsumer<ServicesCubit, ServicesState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    if (state is ProvidersSuccessState) {
                      return setProviders(state.dataList);
                    } else if (state is ErrorState) {
                      UtilsFunctions.createToast(state.message);
                      return NetworkErrorFullPage();
                    } else {
                      return Container();
                    }
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  setProviders(List<Provider> data) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: data.length,
        itemBuilder: (context, index) => ProviderTile(data[index],categoryID,categoryName),
      ),
    );
  }
}
