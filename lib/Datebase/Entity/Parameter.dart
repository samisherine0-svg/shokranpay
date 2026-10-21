import 'package:floor/floor.dart';

@entity
class Parameter {
  @primaryKey
  final int id;

  @ColumnInfo(name: 'nameAr')
  final String nameAr;

  @ColumnInfo(name: "minLength")
  final int minLength;

  @ColumnInfo(name: "maxLength")
  final int maxLength;

  @ColumnInfo(name: "controleType")
  final int controleType;

  @ColumnInfo(name: "serviceId")
  final int serviceId;

  Parameter(this.id, this.nameAr, this.minLength, this.maxLength,
      this.controleType, this.serviceId);
}
