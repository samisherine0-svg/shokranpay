import 'dart:convert';
/// Data : {"Access_Token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1laWQiOiI5Zjg1OTcwOC03NzI3LTRhYWItOWY1ZC0wNWQ1NzhjYTAwYmUiLCJ1bmlxdWVfbmFtZSI6Ik93bmVyIiwiQXNwTmV0LklkZW50aXR5LlNlY3VyaXR5U3RhbXAiOiJQNVM1M1dPSkQyN1RXRkczWkc1Uk9TUENYQ0VVWUQ1SyIsInJvbGUiOiJTdXBlckFkbWluIiwibmJmIjoxNjY5MjgwNTY2LCJleHAiOjE2NjkzNjY5NjYsImlhdCI6MTY2OTI4MDU2NiwiaXNzIjoiaHR0cHM6Ly9sb2NhbGhvc3Q6NDQzMTkvIiwiYXVkIjoiaHR0cHM6Ly9sb2NhbGhvc3Q6NDQzMTkvIn0.7MWrF0gYeFbge-3BDocKgIJaKkuAGzccbHexr38TMb0","Refresh_Token":"7I51pjXxwXml4W0PU7Z2+vnhGl+URGW1dz7QY8h1qIA="}
/// Code : 200
/// Message : "AuthenticatedSuccessfully"

LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));
String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());
class LoginResponse {
  LoginResponse({
      Data? data, 
      int? code, 
      String? message,}){
    _data = data;
    _code = code;
    _message = message;
}

  LoginResponse.fromJson(dynamic json) {
    _data = json['Data'] != null ? Data.fromJson(json['Data']) : null;
    _code = json['Code'];
    _message = json['Message'];
  }
  Data? _data;
  int? _code;
  String? _message;
LoginResponse copyWith({  Data? data,
  int? code,
  String? message,
}) => LoginResponse(  data: data ?? _data,
  code: code ?? _code,
  message: message ?? _message,
);
  Data? get data => _data;
  int? get code => _code;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['Data'] = _data?.toJson();
    }
    map['Code'] = _code;
    map['Message'] = _message;
    return map;
  }

}

/// Access_Token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1laWQiOiI5Zjg1OTcwOC03NzI3LTRhYWItOWY1ZC0wNWQ1NzhjYTAwYmUiLCJ1bmlxdWVfbmFtZSI6Ik93bmVyIiwiQXNwTmV0LklkZW50aXR5LlNlY3VyaXR5U3RhbXAiOiJQNVM1M1dPSkQyN1RXRkczWkc1Uk9TUENYQ0VVWUQ1SyIsInJvbGUiOiJTdXBlckFkbWluIiwibmJmIjoxNjY5MjgwNTY2LCJleHAiOjE2NjkzNjY5NjYsImlhdCI6MTY2OTI4MDU2NiwiaXNzIjoiaHR0cHM6Ly9sb2NhbGhvc3Q6NDQzMTkvIiwiYXVkIjoiaHR0cHM6Ly9sb2NhbGhvc3Q6NDQzMTkvIn0.7MWrF0gYeFbge-3BDocKgIJaKkuAGzccbHexr38TMb0"
/// Refresh_Token : "7I51pjXxwXml4W0PU7Z2+vnhGl+URGW1dz7QY8h1qIA="

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      String? accessToken, 
      String? refreshToken,}){
    _accessToken = accessToken;
    _refreshToken = refreshToken;
}

  Data.fromJson(dynamic json) {
    _accessToken = json['Access_Token'];
    _refreshToken = json['Refresh_Token'];
  }
  String? _accessToken;
  String? _refreshToken;
Data copyWith({  String? accessToken,
  String? refreshToken,
}) => Data(  accessToken: accessToken ?? _accessToken,
  refreshToken: refreshToken ?? _refreshToken,
);
  String? get accessToken => _accessToken;
  String? get refreshToken => _refreshToken;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Access_Token'] = _accessToken;
    map['Refresh_Token'] = _refreshToken;
    return map;
  }

}