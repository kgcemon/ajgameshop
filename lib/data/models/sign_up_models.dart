class SignUpModels {
  int? statusCode;
  bool? success;
  String? message;
  SignUpData? signUpTokenData;

  SignUpModels({this.statusCode, this.success, this.message, this.signUpTokenData});

  SignUpModels.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    success = json['success'];
    message = json['message'];
    signUpTokenData = json['data'] != null ? new SignUpData.fromJson(json['data']) : null;
  }


}

class SignUpData {
  String? accessToken;

  SignUpData({this.accessToken});

  SignUpData.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accessToken'] = this.accessToken;
    return data;
  }
}
