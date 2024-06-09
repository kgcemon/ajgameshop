import 'package:ajgameshop/data/network_caller/network_caller.dart';
import 'package:get/get.dart';
import '../../data/models/deposite_models.dart';
import '../../data/utility/urls.dart';

class WalletHistoryListController extends GetxController {
  bool _inProgress = false;
  String _errorMessage = '';

  bool get inProgress => _inProgress;

  String get errorMessage => _errorMessage;
  List<DepositeData> wallerHistroyDataFromapi = [];

  Future<bool> getWalletHistroList() async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final respons =
        await NetworkCaller.getRequest(url: Urls.deposiHistorytUrls);
    if (respons.isSuccess) {
      wallerHistroyDataFromapi =
          DepositeModels.fromJson(respons.responseData).depositeListData ?? [];
      print(respons.responseData);
    } else {
      _errorMessage = respons.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}
