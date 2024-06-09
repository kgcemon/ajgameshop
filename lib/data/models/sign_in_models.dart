class SignInModels {
  int? statusCode;
  bool? success;
  String? message;
  SignInData? signInTokenData;

  SignInModels({this.statusCode, this.success, this.message, this.signInTokenData});

  SignInModels.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    success = json['success'];
    message = json['message'];
    signInTokenData = json['data'] != null ? new SignInData.fromJson(json['data']) : null;
  }
}

class SignInData {
  String? accessToken;

  SignInData({this.accessToken});

  SignInData.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accessToken'] = this.accessToken;
    return data;
  }
}
