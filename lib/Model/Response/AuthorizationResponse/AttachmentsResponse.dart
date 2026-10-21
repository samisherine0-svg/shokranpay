class AttachmentsResponse {
  List<int>? data;
  int? code;
  String? message;

  AttachmentsResponse({this.data, this.code, this.message});

  AttachmentsResponse.fromJson(Map<String, dynamic> json) {
    data = json['Data'].cast<int>();
    code = json['Code'];
    message = json['Message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Data'] = this.data;
    data['Code'] = this.code;
    data['Message'] = this.message;
    return data;
  }
}