class ChangePasswordBody {
  String? currentPassword;
  String? password;
  String? confirmPassword;

  ChangePasswordBody(
      {this.currentPassword, this.password, this.confirmPassword});

  ChangePasswordBody.fromJson(Map<String, dynamic> json) {
    currentPassword = json['CurrentPassword'];
    password = json['Password'];
    confirmPassword = json['ConfirmPassword'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CurrentPassword'] = this.currentPassword;
    data['Password'] = this.password;
    data['ConfirmPassword'] = this.confirmPassword;
    return data;
  }
}