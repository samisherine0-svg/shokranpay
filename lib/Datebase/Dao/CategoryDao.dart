import 'package:floor/floor.dart';
import 'package:pioneerspay/Datebase/Entity/Category.dart';

@dao
abstract class CategoryDao {
  @Query('SELECT * FROM Category ORDER BY sort')
  Future<List<Category>> getCategories();

  @insert
  Future<void> insertCategories(List<Category> categories);

  @insert
  Future<void> insertCategory(Category category);

  @Query('DELETE FROM Category')
  Future<void> deleteAllCategories();
}
