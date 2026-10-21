import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pioneerspay/Model/Body/HomeBody/get_deposits_body.dart';
import 'package:pioneerspay/Model/Response/HomeResponse/NotificationsResponse.dart';
import 'package:pioneerspay/Model/Response/HomeResponse/banks_response.dart';
import 'package:pioneerspay/Utils/AppUrl.dart';
import 'package:pioneerspay/Utils/Common.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pioneerspay/Model/Response/HomeResponse/AppInfoResponse.dart';

import '../Model/Body/HomeBody/add_deposit_body.dart';
import '../Model/Body/HomeBody/merchant_list_response.dart';
import '../Model/Body/HomeBody/transfer_body.dart';
import '../Model/Body/SellersBody/AddMachineToResellerBody.dart';
import '../Model/Response/HomeResponse/InstallmentTypes.dart';
import '../Model/Response/HomeResponse/MachineSerials.dart';
import '../Model/Response/HomeResponse/MachineTypes.dart';
import '../Model/Response/HomeResponse/MandoubAssignMachines.dart';
import '../Model/Response/HomeResponse/ResellerAssignMachine.dart';
import '../Model/Response/HomeResponse/credit_response.dart';

Future<http.Response> getAccountInfoApi() async {
  try {
    var url = "api/Account/GetAccountInfo";
    var header = await Common.requestHeaderWithToken();
    return http
        .post(
      Uri(scheme: "https", host: AppUrl.AppDomain, path: url),
      headers: header,
    )
        .then((http.Response response) async {
      print("statusCode" + response.statusCode.toString());
      print("res" + response.body.toString());
      return response;
    });
  } catch (e) {
    throw Exception("Error while fetching data");
  }
}

Future<http.Response> getBalanceApi() async {
  try {
    var url = "api/Account/GetBalance";
    var header = await Common.requestHeaderWithToken();
    return http
        .post(
      Uri(scheme: "https", host: AppUrl.AppDomain, path: url),
      headers: header,
    )
        .then((http.Response response) async {
      print("statusCode" + response.statusCode.toString());
      print("res" + response.body.toString());
      return response;
    });
  } catch (e) {
    throw Exception("Error while fetching data");
  }
}

Future<AppInfoResponse> getAppInfoApi() async {
  try {
    var url = "api/V1/AppInfo/GetData";
    var header = await Common.requestHeader();
    return http
        .post(
      Uri(scheme: "https", host: AppUrl.AppDomain, path: url),
      headers: header,
    )
        .then((http.Response response) async {
      print("statusCode" + response.statusCode.toString());
      print("res" + response.body.toString());
      // UtilsFunctions.createToast(response.body.toString());

      AppInfoResponse appInfoResponse =
          AppInfoResponse.fromJson(json.decode(response.body));
      return appInfoResponse;
    });
  } catch (e) {
    throw Exception("Error while fetching data");
  }
}

Future<BanksResponse> getBanksApi() async {
  try {
    var url = "api/v1/Bank/GetAll";
    var header = await Common.requestHeaderWithToken();
    return http
        .get(
      Uri(scheme: "https", host: AppUrl.AppDomain, path: url),
      headers: header,
    )
        .then((http.Response response) async {
      print("statusCode" + response.statusCode.toString());
      print("res" + response.body.toString());
      // UtilsFunctions.createToast(response.body.toString());

      BanksResponse banksResponse =
          BanksResponse.fromJson(json.decode(response.body));
      return banksResponse;
    });
  } catch (e) {
    throw Exception("Error while fetching data");
  }
}

Future<CreditResponse> getCreditApi() async {
  try {
    var url = "api/V1/Credit/GetAll";
    var header = await Common.requestHeaderWithToken();
    return http
        .get(
      Uri(scheme: "https", host: AppUrl.AppDomain, path: url),
      headers: header,
    )
        .then((http.Response response) async {
      print("statusCode" + response.statusCode.toString());
      print("res" + response.body.toString());
      // UtilsFunctions.createToast(response.body.toString());

      CreditResponse creditResponse =
          CreditResponse.fromJson(json.decode(response.body));
      return creditResponse;
    });
  } catch (e) {
    throw Exception("Error while fetching data");
  }
}

Future<CreditResponse> getAllDepositStatusApi() async {
  try {
    var url = "api/V1/Bank/Deposit/GetAllDepositStatus";
    var header = await Common.requestHeaderWithToken();
    return http
        .get(
      Uri(scheme: "https", host: AppUrl.AppDomain, path: url),
      headers: header,
    )
        .then((http.Response response) async {
      print("statusCode" + response.statusCode.toString());
      print("res" + response.body.toString());
      // UtilsFunctions.createToast(response.body.toString());

      CreditResponse creditResponse =
          CreditResponse.fromJson(json.decode(response.body));
      return creditResponse;
    });
  } catch (e) {
    throw Exception("Error while fetching data");
  }
}

Future<http.Response> addDepositApi(AddDepositBody body) async {
  try {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String version = prefs.getString(Common.Version) ?? "V1";
    var url = "api/V1/Bank/Deposit/AddNew";
    var header = await Common.requestHeaderWithToken();
    return http
        .post(
      Uri(scheme: "https", host: AppUrl.AppDomain, path: url),
      body: json.encode(body),
      headers: header,
    )
        .then((http.Response response) async {
      final int statusCode = response.statusCode;

      return response;
    });
  } catch (e) {
    print("e" + e.toString());

    throw Exception("Error while fetching data");
  }
}

Future<http.Response> getDepositsReportApi(GetDepositBody body) async {
  try {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String version = prefs.getString(Common.Version) ?? "V1";
    var url = "api/V1/Bank/Deposit/GetAllBankDepositReport";

    var header = await Common.requestHeaderWithToken();
    return http
        .post(
      Uri(scheme: "https", host: AppUrl.AppDomain, path: url),
      body: json.encode(body),
      headers: header,
    )
        .then((http.Response response) async {
      final int statusCode = response.statusCode;
      return response;
    });
  } catch (e) {
    throw Exception("Error while fetching data");
  }
}

Future<MerchantListResponse> getMyAgentsApi() async {
  try {
    var url = "api/V1/Agent/GetMyAgents";
    var header = await Common.requestHeaderWithToken();
    return http
        .get(
      Uri(scheme: "https", host: AppUrl.AppDomain, path: url),
      headers: header,
    )
        .then((http.Response response) async {
      final int statusCode = response.statusCode;

      MerchantListResponse merchantListResponse =
      MerchantListResponse.fromJson(json.decode(response.body));
      return merchantListResponse;
    });
  } catch (e) {
    throw Exception("Error while fetching data");
  }
}

Future<http.Response>getUserByCodeApi(String id) async {
  try {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String version = prefs.getString(Common.Version) ?? "V1";
    var url = "api/V1/Credit/GetUserWithAgent/UserCode/$id";
    var header = await Common.requestHeaderWithToken();
    return http
        .post(
      Uri(scheme: "https", host: AppUrl.AppDomain, path: url),
      headers: header,
    )
        .then((http.Response response) async {
      final int statusCode = response.statusCode;
      print("statusCode" + statusCode.toString());
      print("res" + response.body.toString());

      return response;
    });
  } catch (e) {
    throw Exception("Error while fetching data");
  }
}
Future<http.Response> transferCreditApi(TransferBody body) async {
  try {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String version = prefs.getString(Common.Version) ?? "V1";
    var url = "api/V1/Credit/TransferCredit";
    var header = await Common.requestHeaderWithToken();
    return http
        .post(
      Uri(scheme: "https", host: AppUrl.AppDomain, path: url),
      body: json.encode(body),
      headers: header,
    )
        .then((http.Response response) async {
      final int statusCode = response.statusCode;
      print("body" + body.toJson().toString());

      print("statusCode" + statusCode.toString());
      print("res" + response.body.toString());

      return response;
    });
  } catch (e) {
    throw Exception("Error while fetching data");
  }
}

///// MachineStore /////////

Future<MachineTypes> getMachineTypesApi() async {
  try {
    var url = "api/V1/MachineStore/GetAllMachineTypes";
    var header = await Common.requestHeaderWithToken();
    return http
        .get(
      Uri(scheme: "https", host: AppUrl.AppDomain, path: url),
      headers: header,
    )
        .then((http.Response response) async {
      print("statusCode" + response.statusCode.toString());
      print("res" + response.body.toString());
      // UtilsFunctions.createToast(response.body.toString());

      MachineTypes machineTypes =
      MachineTypes.fromJson(json.decode(response.body));
      return machineTypes;
    });
  } catch (e) {
    throw Exception("Error while fetching data");
  }
}

Future<MachineSerials> getMachineSerialsApi(id) async {
  try {
    print(id);
    var url = "api/V1/MachineStore/GetAgentMachineSerial/MachineTypeId/$id";
    var header = await Common.requestHeaderWithToken();
    return http
        .get(
      Uri(scheme: "https", host: AppUrl.AppDomain, path: url),
      headers: header,
    )
        .then((http.Response response) async {
      print("statusCode" + response.statusCode.toString());
      print("res" + response.body.toString());
      // UtilsFunctions.createToast(response.body.toString());

      MachineSerials machineSerials =
      MachineSerials.fromJson(json.decode(response.body));
      return machineSerials;
    });
  } catch (e) {
    throw Exception("Error while fetching data");
  }
}

Future<MachineTypes> getMachineInstallmentsApi(id) async {
  try {
    var url = "api/V1/MachineStore/GetMachineInstallments/MachineTypeId/$id";
    var header = await Common.requestHeaderWithToken();
    return http
        .get(
      Uri(scheme: "https", host: AppUrl.AppDomain, path: url),
      headers: header,
    )
        .then((http.Response response) async {
      print("statusCode" + response.statusCode.toString());
      print("res" + response.body.toString());
      // UtilsFunctions.createToast(response.body.toString());

      MachineTypes machineInstallments =
      MachineTypes.fromJson(json.decode(response.body));
      return machineInstallments;
    });
  } catch (e) {
    throw Exception("Error while fetching data");
  }
}

Future<MachineInstallmentTypes> getMachineInstallmentTypesApi(id) async {
  try {
    var url =
        "api/V1/MachineStore/GetInstallmentTypes/MachineInstallmentId/$id";
    var header = await Common.requestHeaderWithToken();
    return http
        .get(
      Uri(scheme: "https", host: AppUrl.AppDomain, path: url),
      headers: header,
    )
        .then((http.Response response) async {
      print("statusCode" + response.statusCode.toString());
      print("res" + response.body.toString());
      // UtilsFunctions.createToast(response.body.toString());

      MachineInstallmentTypes machineInstallmentTypes =
      MachineInstallmentTypes.fromJson(json.decode(response.body));
      return machineInstallmentTypes;
    });
  } catch (e) {
    throw Exception("Error while fetching data");
  }
}

Future<http.Response> addMachineToResellerApi(
    AddMachineToResellerBody body) async {
  try {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String version = prefs.getString(Common.Version) ?? "V1";
    var url = "api/V1/MachineStore/AddMachineToReseller";
    var header = await Common.requestHeaderWithToken();
    return http
        .post(
      Uri(scheme: "https", host: AppUrl.AppDomain, path: url),
      body: json.encode(body),
      headers: header,
    )
        .then((http.Response response) async {
      final int statusCode = response.statusCode;
      print("body" + body.toJson().toString());

      print("statusCode" + statusCode.toString());
      print("res" + response.body.toString());

      return response;
    });
  } catch (e) {
    throw Exception("Error while fetching data");
  }
}

Future<MandoubAssignMachines> getMandoubAssignMachineApi(id) async {
  try {
    var url = "api/V1/MachineStore/GetMandoubAssignMachine/machineStatus/$id";
    var header = await Common.requestHeaderWithToken();
    return http
        .get(
      Uri(scheme: "https", host: AppUrl.AppDomain, path: url),
      headers: header,
    )
        .then((http.Response response) async {
      final int statusCode = response.statusCode;

      MandoubAssignMachines machines =
      MandoubAssignMachines.fromJson(json.decode(response.body));
      return machines;
    });
  } catch (e) {
    throw Exception("Error while fetching data");
  }
}

Future<ResellerAssignMachineDetails> getMachineDetailsApi(id) async {
  try {
    var url = "api/V1/MachineStore/GetResellerAssignMachine/ResellerCode/$id";
    var header = await Common.requestHeaderWithToken();
    return http
        .get(
      Uri(scheme: "https", host: AppUrl.AppDomain, path: url),
      headers: header,
    )
        .then((http.Response response) async {
      final int statusCode = response.statusCode;

      ResellerAssignMachineDetails details =
      ResellerAssignMachineDetails.fromJson(json.decode(response.body));
      return details;
    });
  } catch (e) {
    throw Exception("Error while fetching data");
  }
}
Future<NotificationsResponse> getNotificationsApi() async {
  try {
    var url = "api/V1/Notifications/GetNotifications";
    var header = await Common.requestHeaderWithToken();
    return http
        .get(
      Uri(scheme: "https", host: AppUrl.AppDomain, path: url),
      headers: header,
    )
        .then((http.Response response) async {
      print("statusCode" + response.statusCode.toString());
      print("res" + response.body.toString());
      // UtilsFunctions.createToast(response.body.toString());

      NotificationsResponse notificationsResponse =
      NotificationsResponse.fromJson(json.decode(response.body));
      return notificationsResponse;
    });
  } catch (e) {
    throw Exception("Error while fetching data");
  }
}
