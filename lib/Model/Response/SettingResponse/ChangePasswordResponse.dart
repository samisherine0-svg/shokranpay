class ChangePasswordResponse {
  int? code;
  String? message;

  ChangePasswordResponse({ this.code, this.message});

  ChangePasswordResponse.fromJson(Map<String, dynamic> json) {
    code = json['Code'];
    message = json['Message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Code'] = this.code;
    data['Message'] = this.message;
    return data;
  }
}