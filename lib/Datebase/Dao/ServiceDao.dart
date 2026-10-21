import 'package:floor/floor.dart';
import 'package:pioneerspay/Datebase/Entity/Service.dart';

@dao
abstract class ServiceDao {
  @Query('SELECT * FROM Service WHERE providerId = :providerID ORDER BY sort')
  Future<List<Service>> getServices(String providerID);

  @Query('SELECT * FROM Service')
  Future<List<Service>> getAllServices();

  @insert
  Future<void> insertServices(List<Service> services);

  @insert
  Future<void> insertService(Service service);

  @Query('DELETE FROM Service')
  Future<void> deleteAllServices();
}
