import 'package:floor/floor.dart';

@entity
class Service {
  @primaryKey
  final int id;

  @ColumnInfo(name: 'nameAr')
  final String nameAr;

  @ColumnInfo(name: "icon")
  final String icon;

  @ColumnInfo(name: "sort")
  final int sort;

  @ColumnInfo(name: "providerId")
  final int providerId;

  @ColumnInfo(name: "currentServiceProviderId")
  final int currentServiceProviderId;

  @ColumnInfo(name: "descriptionAr")
  final String descriptionAr;

  @ColumnInfo(name: "poweredByAr")
  final String poweredByAr;

  @ColumnInfo(name: "priceValue")
  final double priceValue;

  @ColumnInfo(name: "priceMinValue")
  final double priceMinValue;

  @ColumnInfo(name: "priceMaxValue")
  final double priceMaxValue;

  @ColumnInfo(name: "paymentType")
  final int paymentType;

  Service(
      this.id,
      this.nameAr,
      this.icon,
      this.sort,
      this.providerId,
      this.currentServiceProviderId,
      this.descriptionAr,
      this.poweredByAr,
      this.priceValue,
      this.priceMinValue,
      this.priceMaxValue,
      this.paymentType);
}
