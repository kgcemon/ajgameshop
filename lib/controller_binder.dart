import 'package:ajgameshop/presentation/state_holders/add_money_controller.dart';
import 'package:ajgameshop/presentation/state_holders/category_list_controller.dart';
import 'package:ajgameshop/presentation/state_holders/image_slider_controller.dart';
import 'package:ajgameshop/presentation/state_holders/main_bottam_nav_bar_controller.dart';
import 'package:ajgameshop/presentation/state_holders/order_controller.dart';
import 'package:ajgameshop/presentation/state_holders/order_status_controller.dart';
import 'package:ajgameshop/presentation/state_holders/paymet_selector_controller.dart';
import 'package:ajgameshop/presentation/state_holders/product_details_controller.dart';
import 'package:ajgameshop/presentation/state_holders/profile_controller.dart';
import 'package:ajgameshop/presentation/state_holders/sign_in_controller.dart';
import 'package:ajgameshop/presentation/state_holders/sign_up_controller.dart';
import 'package:ajgameshop/presentation/state_holders/waller_history_controller.dart';
import 'package:get/get.dart';

class ControllerBinder extends Bindings   {
  @override
  void dependencies() {
    Get.put(MainBottomNavBarController());
    Get.put(SignUpController());
    Get.put(SignInController());
    Get.put(CategoryListController());
    Get.put(ProductDetailsController());
    Get.put(OrderController());
    Get.put(OrderStausListController());
    Get.put(PaymetSelectorController());
    Get.put(ProfileController());
    Get.put(AddMoneyController());
    Get.put(WalletHistoryListController());
    Get.put(ImageSliderController());
  }

}