import 'package:get/get.dart';

class ProductDetailsController extends GetxController {
  var selectedPrich = 0;

  void setPrich( var prich) {
    selectedPrich = prich;
    update();
  }
}
