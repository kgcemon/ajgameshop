import 'package:ajgameshop/presentation/utility/app_colors.dart';
import 'package:ajgameshop/presentation/utility/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../state_holders/profile_controller.dart';

buildAppBar({Color? color}) {

  return AppBar(
    surfaceTintColor: Colors.white,
    backgroundColor: color ?? Colors.white,
    centerTitle: true,
    title: Image.asset(
      AssetsPath.titelPng,
      width: 200,
    ),
    actions: [
      Container(
        width: 50,
        padding: const EdgeInsets.all(4),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            color: AppColors.primaryColor),
        child: Obx(() => Text(
          "৳${Get.find<ProfileController>().walletBalance.obs} ",
          style: const TextStyle(color: Colors.white,fontWeight: FontWeight.w500),
        )),
      ),
      const SizedBox(
        width: 10,
      )
    ],
  );
}
