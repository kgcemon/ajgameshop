import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import '../../data/models/profile_models.dart';
import '../../data/network_caller/network_caller.dart';
import '../../data/utility/urls.dart';

class ProfileController extends GetxController {
  bool _inProgress = false;
  String _errorMessage = '';
  RxString walletBalance = '0.0'.obs;

  bool get inProgress => _inProgress;
  String get errorMessage => _errorMessage;

  ProfileData? userDataFromApi;

  Future<bool> getUser() async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final response = await NetworkCaller.getRequest(url: Urls.getUserUrls);
    if (response.isSuccess) {
      final apiResponse = ProfileModels.fromJson(response.responseData);
      userDataFromApi = apiResponse.data;
      walletBalance.value = userDataFromApi!.wallet;
      isSuccess = true;
      update();
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}
