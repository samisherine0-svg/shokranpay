import 'package:floor/floor.dart';
import 'package:pioneerspay/Datebase/Entity/Provider.dart';

@dao
abstract class ProviderDao {
  @Query('SELECT * FROM Provider WHERE categoryId = :id ORDER BY sort')
  Future<List<Provider>> getProviders(String id);

  @Query('SELECT * FROM Provider')
  Future<List<Provider>> getAllProviders();


  @insert
  Future<void> insertProviders(List<Provider> providers);

  @insert
  Future<void> insertProvider(Provider provider);

  @Query('DELETE FROM Provider')
  Future<void> deleteAllProviders();
}
