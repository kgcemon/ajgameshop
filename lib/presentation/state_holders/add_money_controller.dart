import 'dart:convert';

import 'package:ajgameshop/data/models/network_response.dart';
import 'package:ajgameshop/data/network_caller/network_caller.dart';
import 'package:get/get.dart';
import '../../data/models/uddoktapay_response.dart';
import '../../data/utility/urls.dart';

class AddMoneyController extends GetxController {
  bool _inProgress = false;
  String? _errorMessage;

  bool get inProgress => _inProgress;

  String get errorMessage => _errorMessage ?? 'Login failed! Try again';

  Future<bool> addMoney({
    required String amount,
    required String phoneNumber,
    required String transactionId,
  }) async {
    _inProgress = true;
    update();
    final response = await NetworkCaller.postRequest(
        url: Urls.depositUrls,
        body: {"amount": amount, "trxId": transactionId, "phone": phoneNumber});
    _inProgress = false;
    update();
    if (response.isSuccess) {
      update();
      return true;
    } else {
      _errorMessage = response.errorMessage;
      update();
      return false;
    }
  }

  Future<UddoktapayResponse> payWithUddoktapay({required String amount}) async {
    Map body = {
      "full_name": "EMON KHAN",
      "email": "ENNN@GG.CC",
      "amount": amount,
      'return_type': 'GET',
      "metadata":  {'user_id': '10', 'order_id': '50'},
      "redirect_url": "https://codmshopbd.com/product/fifa-mobile-top-up",
      "cancel_url": "https://codmshopbd.com/product/fifa-mobile-top-up",
    'webhook_url': 'https://codmshopbd.com/api/verify-payment'
    };
    NetworkResponse response = await NetworkCaller.postRequest(
        url: "https://pay.codmshopbd.com/api/checkout-v2",
        body: jsonEncode(body),
        uddoktapayKey: '5eeefde84e85b00406ff3c41c9cee498d4e68372');
    update();
    return UddoktapayResponse.fromJson(response.responseData);
  }
}
