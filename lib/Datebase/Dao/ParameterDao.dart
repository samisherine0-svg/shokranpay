import 'package:floor/floor.dart';
import 'package:pioneerspay/Datebase/Entity/Parameter.dart';

@dao
abstract class ParameterDao {
  @Query('SELECT * FROM Parameter WHERE serviceId = :serviceID')
  Future<List<Parameter>> getParameters(String serviceID);

  @Query('SELECT * FROM Parameter')
  Future<List<Parameter>> getAllParameters();

  @insert
  Future<void> insertParameters(List<Parameter> parameters);

  @insert
  Future<void> insertParameter(Parameter parameter);

  @Query('DELETE FROM Parameter')
  Future<void> deleteAllParameters();
}
