// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datebase.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  CategoryDao? _categoryDaoInstance;

  ProviderDao? _providerDaoInstance;

  ServiceDao? _serviceDaoInstance;

  ParameterDao? _parameterDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Category` (`id` INTEGER NOT NULL, `nameAr` TEXT NOT NULL, `descriptionAr` TEXT NOT NULL, `icon` TEXT NOT NULL, `sort` INTEGER NOT NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Provider` (`id` INTEGER NOT NULL, `nameAr` TEXT NOT NULL, `descriptionAr` TEXT NOT NULL, `icon` TEXT NOT NULL, `sort` INTEGER NOT NULL, `categoryId` INTEGER NOT NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Service` (`id` INTEGER NOT NULL, `nameAr` TEXT NOT NULL, `icon` TEXT NOT NULL, `sort` INTEGER NOT NULL, `providerId` INTEGER NOT NULL, `currentServiceProviderId` INTEGER NOT NULL, `descriptionAr` TEXT NOT NULL, `poweredByAr` TEXT NOT NULL, `priceValue` REAL NOT NULL, `priceMinValue` REAL NOT NULL, `priceMaxValue` REAL NOT NULL, `paymentType` INTEGER NOT NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Parameter` (`id` INTEGER NOT NULL, `nameAr` TEXT NOT NULL, `minLength` INTEGER NOT NULL, `maxLength` INTEGER NOT NULL, `controleType` INTEGER NOT NULL, `serviceId` INTEGER NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  CategoryDao get categoryDao {
    return _categoryDaoInstance ??= _$CategoryDao(database, changeListener);
  }

  @override
  ProviderDao get providerDao {
    return _providerDaoInstance ??= _$ProviderDao(database, changeListener);
  }

  @override
  ServiceDao get serviceDao {
    return _serviceDaoInstance ??= _$ServiceDao(database, changeListener);
  }

  @override
  ParameterDao get parameterDao {
    return _parameterDaoInstance ??= _$ParameterDao(database, changeListener);
  }
}

class _$CategoryDao extends CategoryDao {
  _$CategoryDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _categoryInsertionAdapter = InsertionAdapter(
            database,
            'Category',
            (Category item) => <String, Object?>{
                  'id': item.id,
                  'nameAr': item.nameAr,
                  'descriptionAr': item.descriptionAr,
                  'icon': item.icon,
                  'sort': item.sort
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Category> _categoryInsertionAdapter;

  @override
  Future<List<Category>> getCategories() async {
    return _queryAdapter.queryList('SELECT * FROM Category ORDER BY sort',
        mapper: (Map<String, Object?> row) => Category(
            row['id'] as int,
            row['nameAr'] as String,
            row['descriptionAr'] as String,
            row['icon'] as String,
            row['sort'] as int));
  }

  @override
  Future<void> deleteAllCategories() async {
    await _queryAdapter.queryNoReturn('DELETE FROM Category');
  }

  @override
  Future<void> insertCategories(List<Category> categories) async {
    await _categoryInsertionAdapter.insertList(
        categories, OnConflictStrategy.abort);
  }

  @override
  Future<void> insertCategory(Category category) async {
    await _categoryInsertionAdapter.insert(category, OnConflictStrategy.abort);
  }
}

class _$ProviderDao extends ProviderDao {
  _$ProviderDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _providerInsertionAdapter = InsertionAdapter(
            database,
            'Provider',
            (Provider item) => <String, Object?>{
                  'id': item.id,
                  'nameAr': item.nameAr,
                  'descriptionAr': item.descriptionAr,
                  'icon': item.icon,
                  'sort': item.sort,
                  'categoryId': item.categoryId
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Provider> _providerInsertionAdapter;

  @override
  Future<List<Provider>> getProviders(String id) async {
    return _queryAdapter.queryList(
        'SELECT * FROM Provider WHERE categoryId = ?1 ORDER BY sort',
        mapper: (Map<String, Object?> row) => Provider(
            row['id'] as int,
            row['nameAr'] as String,
            row['descriptionAr'] as String,
            row['icon'] as String,
            row['sort'] as int,
            row['categoryId'] as int),
        arguments: [id]);
  }

  @override
  Future<List<Provider>> getAllProviders() async {
    return _queryAdapter.queryList('SELECT * FROM Provider',
        mapper: (Map<String, Object?> row) => Provider(
            row['id'] as int,
            row['nameAr'] as String,
            row['descriptionAr'] as String,
            row['icon'] as String,
            row['sort'] as int,
            row['categoryId'] as int));
  }

  @override
  Future<void> deleteAllProviders() async {
    await _queryAdapter.queryNoReturn('DELETE FROM Provider');
  }

  @override
  Future<void> insertProviders(List<Provider> providers) async {
    await _providerInsertionAdapter.insertList(
        providers, OnConflictStrategy.abort);
  }

  @override
  Future<void> insertProvider(Provider provider) async {
    await _providerInsertionAdapter.insert(provider, OnConflictStrategy.abort);
  }
}

class _$ServiceDao extends ServiceDao {
  _$ServiceDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _serviceInsertionAdapter = InsertionAdapter(
            database,
            'Service',
            (Service item) => <String, Object?>{
                  'id': item.id,
                  'nameAr': item.nameAr,
                  'icon': item.icon,
                  'sort': item.sort,
                  'providerId': item.providerId,
                  'currentServiceProviderId': item.currentServiceProviderId,
                  'descriptionAr': item.descriptionAr,
                  'poweredByAr': item.poweredByAr,
                  'priceValue': item.priceValue,
                  'priceMinValue': item.priceMinValue,
                  'priceMaxValue': item.priceMaxValue,
                  'paymentType': item.paymentType
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Service> _serviceInsertionAdapter;

  @override
  Future<List<Service>> getServices(String providerID) async {
    return _queryAdapter.queryList(
        'SELECT * FROM Service WHERE providerId = ?1 ORDER BY sort',
        mapper: (Map<String, Object?> row) => Service(
            row['id'] as int,
            row['nameAr'] as String,
            row['icon'] as String,
            row['sort'] as int,
            row['providerId'] as int,
            row['currentServiceProviderId'] as int,
            row['descriptionAr'] as String,
            row['poweredByAr'] as String,
            row['priceValue'] as double,
            row['priceMinValue'] as double,
            row['priceMaxValue'] as double,
            row['paymentType'] as int),
        arguments: [providerID]);
  }

  @override
  Future<List<Service>> getAllServices() async {
    return _queryAdapter.queryList('SELECT * FROM Service',
        mapper: (Map<String, Object?> row) => Service(
            row['id'] as int,
            row['nameAr'] as String,
            row['icon'] as String,
            row['sort'] as int,
            row['providerId'] as int,
            row['currentServiceProviderId'] as int,
            row['descriptionAr'] as String,
            row['poweredByAr'] as String,
            row['priceValue'] as double,
            row['priceMinValue'] as double,
            row['priceMaxValue'] as double,
            row['paymentType'] as int));
  }

  @override
  Future<void> deleteAllServices() async {
    await _queryAdapter.queryNoReturn('DELETE FROM Service');
  }

  @override
  Future<void> insertServices(List<Service> services) async {
    await _serviceInsertionAdapter.insertList(
        services, OnConflictStrategy.abort);
  }

  @override
  Future<void> insertService(Service service) async {
    await _serviceInsertionAdapter.insert(service, OnConflictStrategy.abort);
  }
}

class _$ParameterDao extends ParameterDao {
  _$ParameterDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _parameterInsertionAdapter = InsertionAdapter(
            database,
            'Parameter',
            (Parameter item) => <String, Object?>{
                  'id': item.id,
                  'nameAr': item.nameAr,
                  'minLength': item.minLength,
                  'maxLength': item.maxLength,
                  'controleType': item.controleType,
                  'serviceId': item.serviceId
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Parameter> _parameterInsertionAdapter;

  @override
  Future<List<Parameter>> getParameters(String serviceID) async {
    return _queryAdapter.queryList(
        'SELECT * FROM Parameter WHERE serviceId = ?1',
        mapper: (Map<String, Object?> row) => Parameter(
            row['id'] as int,
            row['nameAr'] as String,
            row['minLength'] as int,
            row['maxLength'] as int,
            row['controleType'] as int,
            row['serviceId'] as int),
        arguments: [serviceID]);
  }

  @override
  Future<List<Parameter>> getAllParameters() async {
    return _queryAdapter.queryList('SELECT * FROM Parameter',
        mapper: (Map<String, Object?> row) => Parameter(
            row['id'] as int,
            row['nameAr'] as String,
            row['minLength'] as int,
            row['maxLength'] as int,
            row['controleType'] as int,
            row['serviceId'] as int));
  }

  @override
  Future<void> deleteAllParameters() async {
    await _queryAdapter.queryNoReturn('DELETE FROM Parameter');
  }

  @override
  Future<void> insertParameters(List<Parameter> parameters) async {
    await _parameterInsertionAdapter.insertList(
        parameters, OnConflictStrategy.abort);
  }

  @override
  Future<void> insertParameter(Parameter parameter) async {
    await _parameterInsertionAdapter.insert(
        parameter, OnConflictStrategy.abort);
  }
}
