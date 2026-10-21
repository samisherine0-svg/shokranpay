class DetailedReportBody {
  DetailedReportBody({
      this.dateFrom, 
      this.dateTo,});

  DetailedReportBody.fromJson(dynamic json) {
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