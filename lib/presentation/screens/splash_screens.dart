import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../state_holders/user_auth_controller.dart';
import '../widgets/app_logo.dart';
import 'auth/signIn_screen.dart';
import 'main_bottam_nav_bar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> _moveToNextScreen() async {
    await Future.delayed(const Duration(seconds: 2));
    final result = await UserAuthController.getUserToken();
    if (result.isEmpty) {

      Get.off(() => LoginScreen());
    } else {
      Get.off(const MainBottomNavBarScreen());
    }
  }

  @override
  void initState() {
    super.initState();

    _moveToNextScreen();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            Spacer(),
            AppLogo(),
            Spacer(),
            CircularProgressIndicator(),
            SizedBox(
              height: 16,
            ),
            Text('v 1.0.0'),
            SizedBox(
              height: 16,
            )
          ],
        ),
      ),
    );
  }
}
