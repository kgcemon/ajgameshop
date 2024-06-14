class UddoktapayResponse {
  bool? status;
  String? message;
  String? paymentUrl;

  UddoktapayResponse({this.status, this.message, this.paymentUrl});

  UddoktapayResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    paymentUrl = json['payment_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['payment_url'] = paymentUrl;
    return data;
  }
}
