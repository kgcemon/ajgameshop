import 'package:ajgameshop/data/models/sign_in_models.dart';
import 'package:ajgameshop/data/network_caller/network_caller.dart';
import 'package:ajgameshop/data/utility/urls.dart';
import 'package:ajgameshop/presentation/state_holders/user_auth_controller.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  bool _inProgress = false;
  String? _errorMessage;

  bool get inProgress => _inProgress;

  String get errorMessage => _errorMessage ?? 'Login failed! Try again';

  Future<bool> signIn({
    required String phoneNumber,
    required String password,
  }) async {
    _inProgress = true;

    update();

    final response = await NetworkCaller.postRequest(
        url: Urls.signInUrls,
        body: {"email": phoneNumber, "password": password});
    _inProgress = false;
    update();

    print(response.responseData);
    if (response.isSuccess) {
      SignInModels signInModels = SignInModels.fromJson(response.responseData);

      await UserAuthController.saveUserToken(
          signInModels.signInTokenData!.accessToken!);

      update();
      return true;
    } else {
      _errorMessage = response.errorMessage;
      update();
      return false;
    }
  }
}
