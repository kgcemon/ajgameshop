import 'package:ajgameshop/presentation/screens/profile_screen.dart';
import 'package:ajgameshop/presentation/screens/wallet_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../state_holders/category_list_controller.dart';
import '../state_holders/image_slider_controller.dart';
import '../state_holders/main_bottam_nav_bar_controller.dart';
import '../state_holders/profile_controller.dart';
import '../state_holders/waller_history_controller.dart';
import '../utility/app_colors.dart';
import '../utility/assets_path.dart';
import 'home_screen.dart';
import 'order_status_screen.dart';

class MainBottomNavBarScreen extends StatefulWidget {
  const MainBottomNavBarScreen({super.key});

  @override
  State<MainBottomNavBarScreen> createState() => _MainBottomNavBarScreenState();
}

class _MainBottomNavBarScreenState extends State<MainBottomNavBarScreen> {
  final MainBottomNavBarController _mainBottomNavBarController =
      Get.find<MainBottomNavBarController>();
  final List<Widget> _screens = [
    const HomeScreen(),
    const OrderStatusScreen(),
    const WalletScreen(),
    const ProfileScreen()
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.find<CategoryListController>().getCategory();
    Get.find<ProfileController>().getUser();
    Get.find<WalletHistoryListController>().getWalletHistroList();
      Get.find<ImageSliderController>().getImageLoad();
    Get.find<ProfileController>().getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<MainBottomNavBarController>(builder: (context) {
        return _screens[_mainBottomNavBarController.selectedIndex];
      }),
      bottomNavigationBar: GetBuilder<MainBottomNavBarController>(builder: (_) {
        return BottomNavigationBar(
          currentIndex: _mainBottomNavBarController.selectedIndex,
          onTap: (index) {
            print(index);
            _mainBottomNavBarController.changeIndex(index);
          },
          selectedItemColor: AppColors.primaryColor,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          items: [
            _buildBottomNavigationBarItem(
                img: AssetsPath.homePng, label: 'Home', index: 0),
            _buildBottomNavigationBarItem(
                img: AssetsPath.chartPng, label: "Order Status", index: 1),
            _buildBottomNavigationBarItem(
                img: AssetsPath.walletPng, label: 'Wallet', index: 2),
            _buildBottomNavigationBarItem(
                img: AssetsPath.userPng, label: 'Profile', index: 3)
          ],
        );
      }),
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem(
      {required img, required label, required index}) {
    return BottomNavigationBarItem(
        icon: Image.asset(
          img,
          color: _mainBottomNavBarController.selectedIndex == index
              ? AppColors.primaryColor
              : Colors.grey,
          width: 20,
        ),
        label: label);
  }
}
