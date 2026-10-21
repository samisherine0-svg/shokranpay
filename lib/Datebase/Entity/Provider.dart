import 'package:floor/floor.dart';

@entity
class Provider {
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

  @ColumnInfo(name: "categoryId")
  final int categoryId;

  Provider(this.id, this.nameAr, this.descriptionAr, this.icon, this.sort, this.categoryId);

}
