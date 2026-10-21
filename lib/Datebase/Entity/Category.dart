import 'package:floor/floor.dart';

@entity
class Category {
  @primaryKey
  final int id;

  @ColumnInfo(name: 'nameAr')
  final String nameAr;

  @ColumnInfo(name: "descriptionAr")
  final String descriptionAr;

  @ColumnInfo(name: "icon")
  final String icon;

  @ColumnInfo(name: "sort")
  final int sort;

  Category(this.id, this.nameAr, this.descriptionAr, this.icon, this.sort);
}
