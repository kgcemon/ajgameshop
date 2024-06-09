import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../state_holders/profile_controller.dart';
import 'main_bottam_nav_bar.dart';

class OrderSuccessScreen extends StatelessWidget {
  OrderSuccessScreen({super.key, required this.oderNumber});

  String oderNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        title: const Text("Payment"),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Get.offAll(() => const MainBottomNavBarScreen());
              Get.find<ProfileController>().getUser();
            },
            icon: const Icon(Icons.cancel)),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              Image.asset(
                "assets/images/done.png",
                height: 90,
                width: 133,
              ),
              const Text(
                "Payment Successful",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              Text("Order number $oderNumber"),
              const Spacer(),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 55)),
                  onPressed: () {
                    Get.offAll(() => const MainBottomNavBarScreen());
                    Get.find<ProfileController>().getUser();
                  },
                  child: const Row(
                    children: [
                      Spacer(),
                      Text(
                        "Track Order",
                        style: TextStyle(color: Colors.white),
                      ),
                      Spacer(),
                      Icon(
                        Icons.arrow_circle_right_outlined,
                        color: Colors.white,
                      )
                    ],
                  )),
              const SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
