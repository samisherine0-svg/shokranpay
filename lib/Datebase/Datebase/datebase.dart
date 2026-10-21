import 'dart:async';

import 'package:floor/floor.dart';
import 'package:pioneerspay/Datebase/Dao/CategoryDao.dart';
import 'package:pioneerspay/Datebase/Dao/ParameterDao.dart';
import 'package:pioneerspay/Datebase/Dao/ProviderDao.dart';
import 'package:pioneerspay/Datebase/Dao/ServiceDao.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:pioneerspay/Datebase/Entity/Category.dart';
import 'package:pioneerspay/Datebase/Entity/Parameter.dart';
import 'package:pioneerspay/Datebase/Entity/Provider.dart';
import 'package:pioneerspay/Datebase/Entity/Service.dart';

part 'datebase.g.dart';
@Database(version: 1, entities: [Category, Provider, Service, Parameter])
abstract class AppDatabase extends FloorDatabase {
  CategoryDao get categoryDao;

  ProviderDao get providerDao;

  ServiceDao get serviceDao;

  ParameterDao get parameterDao;
}
