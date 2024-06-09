import 'package:ajgameshop/data/models/sign_up_models.dart';
import 'package:ajgameshop/presentation/state_holders/user_auth_controller.dart';
import 'package:get/get.dart';

import '../../data/network_caller/network_caller.dart';
import '../../data/utility/urls.dart';

class SignUpController extends GetxController {
  bool _inProgress = false;
  String? _errorMessage;

  bool get inProgress => _inProgress;

  String get errorMessage => _errorMessage ?? 'Login failed! Try again';

  Future<bool> signUp(
      {required String name,
      required String phoneNumber,
      required String password,
      required String confirmPassword}) async {
    _inProgress = true;

    update();
    Map<String, dynamic> inputParams = {

    };

    final response = await NetworkCaller.postRequest(
        url: Urls.signUpUrls, body: { "email": phoneNumber,
      "password": password,
      "phone": phoneNumber,
      "name": name,
      "img": ""});
    _inProgress = false;
    update();

    print(response.responseData);
    if (response.isSuccess) {
      SignUpModels signupResponse =
          SignUpModels.fromJson(response.responseData);

      await UserAuthController.saveUserToken(signupResponse.signUpTokenData!.accessToken!);

      update();
      return true;
    } else {
      _errorMessage = response.errorMessage;
      update();
      return false;
    }
  }
}
