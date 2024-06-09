import 'package:get/get.dart';

import '../../data/network_caller/network_caller.dart';
import '../../data/utility/urls.dart';

class OrderController extends GetxController {
  bool _inProgress = false;
  String? _errorMessage;

  Map orderResult = {};

  bool get inProgress => _inProgress;

  String get errorMessage => _errorMessage ?? 'Login failed! Try again';

  Future<bool> orderApiCall({
    required String productID,
    required String playerId,
  }) async {
    _inProgress = true;

    update();

    final response = await NetworkCaller.postRequest(
        url: Urls.ordersUrls,
        body: {"productId": productID, "playerId": playerId});
    _inProgress = false;
    update();
    print(response.responseData);
    if (response.isSuccess) {
      orderResult = response.responseData;
      update();
      return true;
    } else {
      _errorMessage = response.errorMessage;
      update();
      return false;
    }
  }
}
