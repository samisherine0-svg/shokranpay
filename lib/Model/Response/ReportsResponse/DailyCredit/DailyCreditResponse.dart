class DailyCreditResponse {
  Data? data;
  int? code;
  String? message;

  DailyCreditResponse({this.data, this.code, this.message});

  DailyCreditResponse.fromJson(Map<String, dynamic> json) {
    data = json['Data'] != null ? new Data.fromJson(json['Data']) : null;
    code = json['Code'];
    message = json['Message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['Data'] = this.data!.toJson();
    }
    data['Code'] = this.code;
    data['Message'] = this.message;
    return data;
  }
}

class Data {
  double? consumer;
  double? rejected;
  double? creditAddedFromAdmin;
  double? creditDiscountFromAdmin;
  double? creditDiscountFromMeToAgent;
  double? creditAddedFromAgentToMe;
  double? profitReturn;
  int? transactionCount;
  double? pending;

  Data(
      {this.consumer,
        this.rejected,
        this.pending,
        this.creditAddedFromAdmin,
        this.creditDiscountFromAdmin,
        this.creditDiscountFromMeToAgent,
        this.creditAddedFromAgentToMe,
        this.profitReturn,
        this.transactionCount});

  Data.fromJson(Map<String, dynamic> json) {
    consumer = json['Consumer'];
    rejected = json['Rejected'];
    pending = json['Pending'];
    creditAddedFromAdmin = json['CreditAddedFromAdmin'];
    creditDiscountFromAdmin = json['CreditDiscountFromAdmin'];
    creditDiscountFromMeToAgent = json['CreditDiscountFromMeToAgent'];
    creditAddedFromAgentToMe = json['CreditAddedFromAgentToMe'];
    profitReturn = json['ProfitReturn'];
    transactionCount = json['TransactionCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Consumer'] = this.consumer;
    data['Rejected'] = this.rejected;
    data['Pending'] = this.pending;
    data['CreditAddedFromAdmin'] = this.creditAddedFromAdmin;
    data['CreditDiscountFromAdmin'] = this.creditDiscountFromAdmin;
    data['CreditDiscountFromMeToAgent'] = this.creditDiscountFromMeToAgent;
    data['CreditAddedFromAgentToMe'] = this.creditAddedFromAgentToMe;
    data['ProfitReturn'] = this.profitReturn;
    data['TransactionCount'] = this.transactionCount;
    return data;
  }
}