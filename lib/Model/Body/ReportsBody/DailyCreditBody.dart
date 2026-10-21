class DailyCreditBody {
  DailyCreditBody({
      this.dateFrom, 
      this.dateTo,});

  DailyCreditBody.fromJson(dynamic json) {
    dateFrom = json['DateFrom'];
    dateTo = json['DateTo'];
  }
  String? dateFrom;
  String? dateTo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['DateFrom'] = dateFrom;
    map['DateTo'] = dateTo;
    return map;
  }

}