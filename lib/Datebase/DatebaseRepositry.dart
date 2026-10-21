import 'package:flutter/material.dart';
import 'package:pioneerspay/Datebase/Datebase/datebase.dart';
import 'package:pioneerspay/Datebase/Entity/Category.dart';
import 'package:pioneerspay/Datebase/Entity/Parameter.dart';
import 'package:pioneerspay/Datebase/Entity/Provider.dart';
import 'package:pioneerspay/Datebase/Entity/Service.dart';
import 'package:pioneerspay/Model/Response/ServicesResponse/ServicesListResponse.dart';
import 'package:pioneerspay/Ui/Utils/UtilsFunctions.dart';

class DataBaseRepositry {
  static storeData(Data data, BuildContext context) async {
    try {
      await storeCategories(data.item!.categories!);
      await storeProviders(data.item!.providers!);
      await storeServices(data.item!.services!);
      await storeParameters(data.item!.parameters!);
    } catch (e) {
      print("EX : $e");
    }
  }

  ///////////////// insert //////////////////////////

  static storeCategories(List<Categories> categories) async {
    final database =
        await $FloorAppDatabase.databaseBuilder('app_database.db').build();

    final categoriesDao = database.categoryDao;
    List<Category> list = [];
    for (int i = 0; i < categories.length; i++) {
      Categories item = categories.elementAt(i);
      Category category = Category(
          item.id!, item.nameAr!, item.descriptionAr!, item.icon!, item.sort!);
      list.add(category);
      await categoriesDao.insertCategory(category);

    }
  }

  static storeProviders(List<Providers> providers) async {
    final database =
        await $FloorAppDatabase.databaseBuilder('app_database.db').build();
    final providersDao = database.providerDao;
    List<Provider> list = [];
    for (int i = 0; i < providers.length; i++) {
      Providers item = providers.elementAt(i);
      Provider provider = Provider(item.id!, item.nameAr!, item.descriptionAr!,
          item.icon!, item.sort!, item.categoryId!);
      list.add(provider);
      await providersDao.insertProvider(provider);
    }
  }

  static storeServices(List<Services> services) async {
    final database =
        await $FloorAppDatabase.databaseBuilder('app_database.db').build();
    final servicesDao = database.serviceDao;
    List<Service> list = [];
    for (int i = 0; i < services.length; i++) {
      Services item = services.elementAt(i);
      Service service = Service(
          item.id!,
          item.nameAr!,
          item.icon!,
          item.sort!,
          item.providerId!,
          item.currentServiceProviderId!,
          item.serviceConfig!.descriptionAr!,
          item.serviceConfig!.poweredByAr!,
          item.serviceConfig!.priceValue!,
          item.serviceConfig!.priceMinValue!,
          item.serviceConfig!.priceMaxValue!,
          item.serviceConfig!.paymentType!);
      list.add(service);
      await servicesDao.insertService(service);
    }
  }

  static storeParameters(List<Parameters> parameters) async {
    final database =
        await $FloorAppDatabase.databaseBuilder('app_database.db').build();
    final parametersDao = database.parameterDao;
    List<Parameter> list = [];
    for (int i = 0; i < parameters.length; i++) {
      Parameters item = parameters.elementAt(i);
      Parameter parameter = Parameter(item.id!, item.nameAr!, item.minLength!,
          item.maxLength!, item.controleType!, item.serviceId!);
      list.add(parameter);
      await parametersDao.insertParameter(parameter);
    }
    UtilsFunctions.createToast("Done");
  }

  ///////////////////////// retrieve ////////////////////////

  static Future<List<Category>> getCategories() async {
    final database =
        await $FloorAppDatabase.databaseBuilder('app_database.db').build();
    final categoriesDao = database.categoryDao;
    List<Category> list = await categoriesDao.getCategories();
    return list;
  }

  static Future<List<Provider>> getProviders(String categoryID) async {
    final database =
        await $FloorAppDatabase.databaseBuilder('app_database.db').build();
    final providersDao = database.providerDao;
    List<Provider> list = await providersDao.getProviders(categoryID);
    return list;
  }

  static Future<List<Service>> getServices(String providerID) async {
    final database =
        await $FloorAppDatabase.databaseBuilder('app_database.db').build();
    final servicesDao = database.serviceDao;
    List<Service> list = await servicesDao.getServices(providerID);
    return list;
  }

  static Future<List<Parameter>> getParameters(String serviceID) async {
    final database =
        await $FloorAppDatabase.databaseBuilder('app_database.db').build();
    final parametersDao = database.parameterDao;
    List<Parameter> list = await parametersDao.getParameters(serviceID);
    return list;
  }

  ///////////////////////// delete ////////////////////////

  static Future<bool> removeCategoriesFromDateBase() async {
    final database =
        await $FloorAppDatabase.databaseBuilder('app_database.db').build();
    final categoryDao = database.categoryDao;

    await categoryDao.deleteAllCategories();
    List<Category> list = await categoryDao.getCategories();
    if (list.isEmpty) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> removeProvidersFromDateBase() async {
    final database =
        await $FloorAppDatabase.databaseBuilder('app_database.db').build();
    final providerDao = database.providerDao;

    await providerDao.deleteAllProviders();
    List<Provider> list = await providerDao.getAllProviders();
    if (list.isEmpty) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> removeServicesFromDateBase() async {
    final database =
        await $FloorAppDatabase.databaseBuilder('app_database.db').build();
    final servicesDao = database.serviceDao;

    await servicesDao.deleteAllServices();
    List<Service> list = await servicesDao.getAllServices();
    if (list.isEmpty) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> removeParametersFromDateBase() async {
    final database =
        await $FloorAppDatabase.databaseBuilder('app_database.db').build();
    final parameterDao = database.parameterDao;

    await parameterDao.deleteAllParameters();
    List<Parameter> list = await parameterDao.getAllParameters();
    if (list.isEmpty) {
      return true;
    } else {
      return false;
    }
  }
}
