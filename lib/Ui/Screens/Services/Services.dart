import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pioneerspay/Cubit/ServicesCubit/ServicesCubit.dart';
import 'package:pioneerspay/Datebase/Entity/Service.dart';
import 'package:pioneerspay/Ui/Screens/Services/Providers.dart';
import 'package:pioneerspay/Ui/Utils/AppBarCustom.dart';
import 'package:pioneerspay/Ui/Utils/NetworkErrorFullPage.dart';
import 'package:pioneerspay/Ui/Utils/UtilsFunctions.dart';
import 'package:pioneerspay/Utils/Colors/GeneralColor.dart';
import 'package:pioneerspay/Ui/Widgets/Services/ServiceTile.dart';

class Services extends StatefulWidget {
  String providerID;
  String providerName;
  String categoryID;
  String categoryName;

  Services(this.providerID, this.providerName,this.categoryID,this.categoryName);

  @override
  _Services createState() => _Services(providerID, providerName,categoryID,categoryName);
}

class _Services extends State<Services> {
  String providerID;
  String providerName;
  String categoryID;
  String categoryName;

  _Services(this.providerID, this.providerName,this.categoryID,this.categoryName);

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
            child: AppBarCustom(providerName,
                  () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Providers(categoryID,categoryName)));
              },),
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: BlocProvider(
                create: (_) =>
                ServicesCubit()..getLocalServices(providerID, context),
                child: BlocConsumer<ServicesCubit, ServicesState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    if (state is ServicesSuccessState) {
                      return setServices(state.dataList);
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

  setServices(List<Service> data) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: data.length,
        itemBuilder: (context, index) => ServiceTile(data[index],providerID,providerName,categoryID,categoryName),
      ),
    );
  }
}
