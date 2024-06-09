import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../state_holders/profile_controller.dart';
import '../utility/app_colors.dart';
import '../utility/assets_path.dart';

class AppDrawerMenu extends StatelessWidget {
  const AppDrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(0),
            child: UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    Get.find<ProfileController>().userDataFromApi?.img ??
                        AssetsPath.bkashPng),
              ),
              decoration: const BoxDecoration(
                color: AppColors.primaryColor,
              ),
              accountName: Text(
                  Get.find<ProfileController>().userDataFromApi?.name ?? " no data "),
              accountEmail: Text(
                  Get.find<ProfileController>().userDataFromApi?.phone ?? " no data "),
            ),
          ),
          const Card(
            child: ListTile(
              leading: Icon(Icons.phone),
              title: Text('contract'),
            ),
          ),
          const Card(
            child: ListTile(
              leading: Icon(Icons.phone),
              title: Text('contract'),
            ),
          ),
          const Card(
            child: ListTile(
              leading: Icon(Icons.phone),
              title: Text('contract'),
            ),
          ),
          const Card(
            child: ListTile(
              leading: Icon(Icons.phone),
              title: Text('contract'),
            ),
          ),
          const Card(
            child: ListTile(
              leading: Icon(Icons.phone),
              title: Text('contract'),
            ),
          ),
          const Card(
            child: ListTile(
              leading: Icon(Icons.phone),
              title: Text('contract'),
            ),
          )
        ],
      ),
    );
  }
}
