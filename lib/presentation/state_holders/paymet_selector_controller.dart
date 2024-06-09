import 'package:get/get.dart';

class PaymetSelectorController extends GetxController {
  String selectedPaymentMethod = "Bkash";
  String number = '10100100';

  void updatePaymentMethod(String method) {
    selectedPaymentMethod = method;
    update();
    switch (method) {
      case 'Bkash':
        number = '0190000000';
        update();
        break;
      case 'Nagad':
        number = '0100000000';
        update();
        break;
      case 'Rocket':
        number = '016000000';
        update();
        break;
    }
  }
}
