class DetailedReportResponse {
  List<Data>? data;
  int? code;
  String? message;

  DetailedReportResponse({this.data, this.code, this.message});

  DetailedReportResponse.fromJson(Map<String, dynamic> json) {
    if (json['Data'] != null) {
      data =  [];
      json['Data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    code = json['Code'];
    message = json['Message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['Data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['Code'] = this.code;
    data['Message'] = this.message;
    return data;
  }
}

class Data {
  double? consumer;
  int? transactionCount;
  double? profitReturn;
  String? categoryName;

  Data(
      {this.consumer,
        this.transactionCount,
        this.profitReturn,
        this.categoryName});

  Data.fromJson(Map<String, dynamic> json) {
    consumer = json['Consumer'];
    transactionCount = json['TransactionCount'];
    profitReturn = json['ProfitReturn'];
    categoryName = json['CategoryName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Consumer'] = this.consumer;
    data['TransactionCount'] = this.transactionCount;
    data['ProfitReturn'] = this.profitReturn;
    data['CategoryName'] = this.categoryName;
    return data;
  }
}