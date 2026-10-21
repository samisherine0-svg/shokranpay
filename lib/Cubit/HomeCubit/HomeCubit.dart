import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pioneerspay/Datebase/DatebaseRepositry.dart';
import 'package:pioneerspay/Datebase/Entity/Category.dart';
import 'package:pioneerspay/Model/Response/HomeResponse/AccountInfoResponse.dart'
    as c2;
import 'package:pioneerspay/Model/Response/HomeResponse/BalanceResponse.dart' as c3;
import 'package:pioneerspay/Model/Response/HomeResponse/AppInfoResponse.dart' as c4;
import 'package:pioneerspay/Model/Response/ServicesResponse/ServicesListResponse.dart';
import 'package:pioneerspay/Repositry/ServicesRepositry.dart';
import 'package:pioneerspay/Repositry/HomeRepositry.dart';
import 'package:pioneerspay/Ui/Screens/Authoriation/Login.dart';
import 'package:pioneerspay/Ui/Utils/Progress.dart';
import 'package:pioneerspay/Ui/Screens/Home/Home.dart';
import 'package:pioneerspay/Ui/Utils/UtilsFunctions.dart';
import 'package:pioneerspay/Utils/Common.dart';
import 'package:pioneerspay/Utils/Language/translation_strings.dart';
import 'package:pioneerspay/Datebase/DatebaseRepositry.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'HomeState.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(InitialHomeState());

  static HomeCubit get(context) => BlocProvider.of(context);

  //////////////// Categories ////////////////////

  getLocalCategories(BuildContext context) async {
    try {
      var response = await DataBaseRepositry.getCategories();
      emit(CategoriesSuccessState(response));
    } catch (ex) {
      emit(CategoriesErrorState(ex.toString()));
    }
  }

  //////////////// update services ////////////////////

  getServices(BuildContext context) async {
    try {
      var response = await getServicesListApi();
      if (response.code == 200) {
        updateApp(context, response.data!);
      } else if (response.code == 401) {
        Progress.dismiss();
        UtilsFunctions.createToast(Translations.of(context)!.userNotFound);
      } else {
        Progress.dismiss();
        Common.logout();

        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Login()));
      }
    } catch (e) {
      Progress.dismiss();
      UtilsFunctions.createToast(Translations.of(context)!.errorPleaseTryAgain);
    }
  }

  updateApp(BuildContext context, Data data) async {
    bool isDeleted = await removeAllData(context);
    if (isDeleted) {
      updateServices(context, data);
    } else {
      errorMessage(context);
    }
  }

  Future<bool> removeAllData(BuildContext context) async {
    try {
      bool deleteParameters =
          await DataBaseRepositry.removeParametersFromDateBase();
      if (deleteParameters) {
        bool deleteProviders =
            await DataBaseRepositry.removeProvidersFromDateBase();
        if (deleteProviders) {
          bool deleteServices =
              await DataBaseRepositry.removeServicesFromDateBase();
          if (deleteServices) {
            bool deleteCategories =
                await DataBaseRepositry.removeCategoriesFromDateBase();
            if (deleteCategories) {
              return true;
            } else {
              errorMessage(context);
              return false;
            }
          } else {
            errorMessage(context);
            return false;
          }
        } else {
          errorMessage(context);
          return false;
        }
      } else {
        errorMessage(context);
        return false;
      }
    } catch (e) {
      errorMessage(context);
      return false;
    }
  }

  updateServices(BuildContext context, Data servicesData) async {
    try {
      await DataBaseRepositry.storeData(servicesData, context);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString(Common.Version, servicesData.version!.api!);
      Progress.dismiss();
      UtilsFunctions.createToast(Translations.of(context)!.updateSuccess);
      Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
    } catch (e) {
      errorMessage(context);
    }
  }

  errorMessage(BuildContext context) {
    Progress.dismiss();
    UtilsFunctions.createToast(Translations.of(context)!.errUpdate);
  }

  //////////////// Account info ////////////////////

  getAccountInfo(BuildContext context) async {
    try {
      emit(AccountInfoLoadState());
      http.Response response = await getAccountInfoApi();
      int statusCode = response.statusCode;
      if (statusCode == 200) {
        c2.AccountInfoResponse accountInfoResponse =
            c2.AccountInfoResponse.fromJson(json.decode(response.body));
        emit(AccountInfoSuccessState(accountInfoResponse));
      } else if (statusCode == 401) {
        Common.logout();
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Login()));
      } else {
        emit(AccountInfoErrorState(
            Translations.of(context)!.errorPleaseTryAgain));
      }
    } catch (ex) {
      emit(AccountInfoErrorState(ex.toString()));
    }
  }

  /////////////// Balance //////////////////////

  getBalance(BuildContext context) async {
    try {
      emit(BalanceLoadingState());
      http.Response response = await getBalanceApi();
      int statusCode = response.statusCode;
      if (statusCode == 200) {
        c3.BalanceResponse balanceResponse =
        c3.BalanceResponse.fromJson(json.decode(response.body));
        emit(BalanceSuccessState(balanceResponse));
      } else if (statusCode == 401) {
        Common.logout();
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Login()));
      } else {
        emit(BalanceErrorState(
            Translations.of(context)!.errorPleaseTryAgain));
      }
    } catch (ex) {
      emit(BalanceErrorState(ex.toString()));
    }
  }


  //////////////////// app info //////////////

  getAppInfo(BuildContext context) async {
    try {
      var response = await getAppInfoApi();
      emit(AppInfoSuccessState(response));
    } catch (ex) {
      emit(AppInfoErrorState(ex.toString()));
    }
  }
}
