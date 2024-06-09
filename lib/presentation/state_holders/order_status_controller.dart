import 'package:get/get.dart';
import '../../data/models/order_status_models.dart';
import '../../data/network_caller/network_caller.dart';
import '../../data/utility/urls.dart';

class OrderStausListController extends GetxController {
  bool _inProgress = false;
  String _errorMessage = '';

  bool get inProgress => _inProgress;

  String get errorMessage => _errorMessage;
  List<StatusData> orderStatusDataFromapi = [];

  Future<bool> getOrderStausList() async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final respons =
        await NetworkCaller.getRequest(url: Urls.getorderListssUrls);
    if (respons.isSuccess) {
      orderStatusDataFromapi =
          OrderStatusModels.fromJson(respons.responseData).data ?? [];
      print(respons.responseData);
    } else {
      _errorMessage = respons.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}
