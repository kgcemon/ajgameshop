import 'package:ajgameshop/presentation/screens/splash_screens.dart';
import 'package:ajgameshop/presentation/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller_binder.dart';

class FFTopUp extends StatelessWidget {
  const FFTopUp({super.key});

  static GlobalKey<NavigatorState> navigationkey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: FFTopUp.navigationkey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: AppColors.primaryColor)),
          scaffoldBackgroundColor: Colors.white,
          colorSchemeSeed: AppColors.primaryColor,
          inputDecorationTheme: InputDecorationTheme(
            border: inputBorder(),
            focusedBorder: inputBorder(),
            enabledBorder: inputBorder(),
          )),
      home: const SplashScreen(),
      initialBinding: ControllerBinder(),
    );
  }

  inputBorder() => const OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primaryColor),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      );
}
