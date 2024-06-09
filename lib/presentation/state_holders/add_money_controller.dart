import 'package:ajgameshop/data/network_caller/network_caller.dart';
import 'package:get/get.dart';

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

    print(response.responseData);
    if (response.isSuccess) {
      update();
      return true;
    } else {
      _errorMessage = response.errorMessage;
      update();
      return false;
    }
  }
}
