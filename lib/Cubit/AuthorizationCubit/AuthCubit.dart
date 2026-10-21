import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pioneerspay/Model/Body/AuthorizationBody/LoginBody.dart';
import 'package:pioneerspay/Model/Response/AuthorizationResponse/LoginResponse.dart'
    as c1;
import 'package:pioneerspay/Model/Response/ServicesResponse/ServicesListResponse.dart'
    as c2;
import 'package:pioneerspay/Model/Response/AuthorizationResponse/AddressResponse.dart'
    as c3;
import 'package:pioneerspay/Model/Response/HomeResponse/AccountInfoResponse.dart'
as c4;
import 'package:pioneerspay/Repositry/AuthorizationRepositry.dart';
import 'package:pioneerspay/Repositry/ServicesRepositry.dart';
import 'package:pioneerspay/Ui/Screens/Authoriation/Login.dart';
import 'package:pioneerspay/Datebase/DatebaseRepositry.dart';
import 'package:http/http.dart' as http;

import 'package:pioneerspay/Ui/Screens/Home/Home.dart';
import 'package:pioneerspay/Ui/Utils/Progress.dart';
import 'package:pioneerspay/Ui/Utils/UtilsFunctions.dart';
import 'package:pioneerspay/Utils/Common.dart';
import 'package:pioneerspay/Utils/Language/translation_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Model/Body/AuthorizationBody/CreateNewAccountBody.dart';
import '../../Model/Response/AuthorizationResponse/AddressResponse.dart';
import '../../Model/Response/AuthorizationResponse/AttachmentsResponse.dart';
import '../../Model/Response/AuthorizationResponse/CreateNewAccountResponse.dart';
import '../../Repositry/HomeRepositry.dart';
import '../../Ui/Screens/Authoriation/ChangeRequirdPassword.dart';
import '../../Ui/Screens/Authoriation/ConfimCode.dart';

part 'AuthState.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(InitialAuthState());

  static AuthCubit get(context) => BlocProvider.of(context);

  login(LoginBody loginBody, BuildContext context) async {
    try {
      var response = await loginApi(loginBody);
      if (response.code == 200) {
        saveUserPassword(
            loginBody.rememberMe, loginBody.userName, loginBody.password);
        saveUserData(context, response.data!);
      } else if (response.code == 555) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ConfirmCode(
                  name: loginBody.userName!,
                  password: loginBody.password!,
                  deviceID: loginBody.AppId!,
                )));
      }else {
        Progress.dismiss();
        UtilsFunctions.createToast(response.message!);
      }
    } catch (e) {
      Progress.dismiss();
      print(e);
      UtilsFunctions.createToast(Translations.of(context)!.errorPleaseTryAgain);
    }
  }

  saveUserPassword(isSave, name, password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(Common.isSave, isSave!);
    if (isSave == true) {
      prefs.setString(Common.LoginName, name!);
      prefs.setString(Common.Password, password!);
    } else {
      prefs.setString(Common.LoginName, "");
      prefs.setString(Common.Password, "");
    }
  }

  getServices(BuildContext context, c1.Data loginData) async {
    try {
      var response = await getServicesListApi();
      if (response.code == 200) {
        updateServices(context, loginData, response.data!);
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
      UtilsFunctions.createToast(e.toString());

      Progress.dismiss();
      UtilsFunctions.createToast(Translations.of(context)!.errorPleaseTryAgain);
    }
  }

  checkDatebase(BuildContext context, c1.Data loginData) async {
    var response = await DataBaseRepositry.getCategories();

    if (response.isEmpty) {
      updateApp(context, loginData);
    } else {
      saveUserData(context, loginData);
    }
  }

  updateApp(BuildContext context, c1.Data loginData) async {
    bool isDeleted = await removeAllData(context);
    if (isDeleted) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString(Common.AccessToken, loginData.accessToken!);
      getServices(context, loginData);
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

  updateServices(
      BuildContext context, c1.Data loginData, c2.Data servicesData) async {
    try {
      await DataBaseRepositry.storeData(servicesData, context);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString(Common.Version, servicesData.version!.api!);
      saveUserData(context, loginData);
    } catch (e) {
      print("EE : " + e.toString());
      errorMessage(context);
    }
  }

  errorMessage(BuildContext context) {
    Progress.dismiss();
    UtilsFunctions.createToast(Translations.of(context)!.errUpdate);
  }

  saveUserData(BuildContext context, c1.Data data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(Common.AccessToken, data.accessToken!);
    prefs.setString(Common.RefreshToken, data.refreshToken!);
    prefs.setBool(Common.isLogin, true);
    getAccountInfo(context);
  }

  getAccountInfo(BuildContext context) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String password = prefs.getString(Common.Password) ?? "";
      http.Response response = await getAccountInfoApi();
      int statusCode = response.statusCode;
      c4.AccountInfoResponse accountInfoResponse =
      c4.AccountInfoResponse.fromJson(json.decode(response.body));
      if (statusCode == 200) {
        SharedPreferences prefs = await SharedPreferences.getInstance();

        // prefs.setString(
        //     Common.UserCode, accountInfoResponse.data!.userCode.toString());
        prefs.setString(Common.UserName,
            "${accountInfoResponse.data!.firstName.toString()} ${accountInfoResponse.data!.lastName.toString()}");
        print(accountInfoResponse.data!.userCode.toString());
        Progress.dismiss();
        Navigator.pushAndRemoveUntil<dynamic>(
          context,
          MaterialPageRoute<dynamic>(
            builder: (BuildContext context) => Home(),
          ),
              (route) => false,
        );
      } else if (accountInfoResponse.code == 999) {
        Progress.dismiss();
        UtilsFunctions.createToast(accountInfoResponse.message!);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ChangeRequiredPassword(
                  password: password,
                )));
      } else if (statusCode == 401) {
        Common.logout();
        Navigator.pushAndRemoveUntil<dynamic>(
          context,
          MaterialPageRoute<dynamic>(
            builder: (BuildContext context) => Login(),
          ),
              (route) => false,
        );
      } else {
        Progress.dismiss();
        UtilsFunctions.createToast(accountInfoResponse.message!);
      }
    } catch (ex) {
      Progress.dismiss();
      // UtilsFunctions.createToast(Translations.of(context)!.userNotFound);
      UtilsFunctions.createToast(Translations.of(context)!.errorPleaseTryAgain);
    }
  }

  createNewAccount(BuildContext context, CreateNewAccountBody body) async {
    try {
      http.Response response = await createNewAccountApi(body);
      int statusCode = response.statusCode;
      Progress.dismiss();
      if (statusCode == 200) {
        CreateNewAccountResponse res =
            CreateNewAccountResponse.fromJson(json.decode(response.body));
        if (res.code == 200) {
          UtilsFunctions.createToast(res.message!);
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Login()));
        } else {
          UtilsFunctions.createToast(res.message!);
        }
      } else if (statusCode == 401) {
        Common.logout();
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Login()));
      } else {
        UtilsFunctions.createToast(
            Translations.of(context)!.errorPleaseTryAgain);
      }
    } catch (ex) {
      Progress.dismiss();
      UtilsFunctions.createToast(ex.toString());
    }
  }

  getAddress(BuildContext context) async {
    try {
      emit(AddressLoadState());
      AddressResponse response = await getAddressApi();
      int statusCode = response.code!;
      if (statusCode == 200) {
        emit(AddressSuccessState(response.data!));
      } else if (statusCode == 401) {
        Common.logout();
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Login()));
      } else {
        emit(AddressErrorState(Translations.of(context)!.errorPleaseTryAgain));
      }
    } catch (ex) {
      emit(AddressErrorState(ex.toString()));
    }
  }
  resendCode(LoginBody loginBody, BuildContext context) async {
    try {
      var response = await resendCodeApi(loginBody);
      print("hereee" + response.message!);
      Progress.dismiss();
      if (response.code == 200) {
        UtilsFunctions.createToast(response.message!);
      } else if (response.code == 401) {
        UtilsFunctions.createToast(response.message!);
      } else {
        UtilsFunctions.createToast(response.message!);
      }
    } catch (e) {
      Progress.dismiss();
      // UtilsFunctions.createToast(Translations.of(context)!.userNotFound);
      UtilsFunctions.createToast(Translations.of(context)!.errorPleaseTryAgain);
    }
  }

  addAttachments(List<String> listImages,
      CreateNewAccountBody createNewAccountBody, BuildContext context) async {
    try {
      var response = await addAttachmentsApi(listImages);
      String body = await response.stream.bytesToString();
      print("res" + body.toString());

      AttachmentsResponse attachmentsResponse =
          AttachmentsResponse.fromJson(json.decode(body));
      if (attachmentsResponse.code == 200) {
        createNewAccountBody.attachmentsIds = attachmentsResponse.data!;
        createNewAccount(context, createNewAccountBody);
        print("success");
      } else {
        Progress.dismiss();
        UtilsFunctions.createToast(attachmentsResponse.message!);
      }
    } catch (e) {
      Progress.dismiss();
      UtilsFunctions.createToast(Translations.of(context)!.errorPleaseTryAgain);
    }
  }
}
