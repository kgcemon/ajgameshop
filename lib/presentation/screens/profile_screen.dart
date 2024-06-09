import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../state_holders/profile_controller.dart';
import '../state_holders/user_auth_controller.dart';
import '../utility/app_colors.dart';
import '../widgets/profile_order_status_button.dart';
import 'auth/signIn_screen.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final ProfileController _profileController = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  color: AppColors.primaryColor,
                  height: 150,
                  width: double.infinity,
                ),
                Positioned(
                  top: 75,
                  left: Get.width / 2 - 60,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(_profileController
                            .userDataFromApi?.img ??
                        'https://via.placeholder.com/150'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    _profileController.userDataFromApi?.name ?? 'Unknown',
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(_profileController.userDataFromApi?.phone ?? 'no data'),
                  const SizedBox(height: 20),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ProfileOrderStausButton(title: 'Total Order', count: '4'),
                      ProfileOrderStausButton(
                          title: 'Complete Order', count: '0'),
                      ProfileOrderStausButton(
                          title: 'Pending Order', count: '1'),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Card(
              margin: const EdgeInsets.all(10),
              child: ListTile(
                title: Text('Email : ${_profileController.userDataFromApi?.email ?? 'no data'}'),
              ),
            ),
            Card(
              margin: const EdgeInsets.all(10),
              child: ListTile(
                title: Text('Current Balance : ${_profileController.userDataFromApi?.wallet  ?? 'no data'  } \$'),
              ),
            ),
            Card(
              margin: const EdgeInsets.all(10),
              child: ListTile(
                onTap: () async {
                  await UserAuthController.clearUserData();
                  if (UserAuthController.accessToken.isEmpty) {
                    Get.off(const LoginScreen());
                  }
                },
                trailing: const Icon(Icons.logout_sharp),
                title: const Text(
                  'Log Out',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const Spacer(),
            SizedBox(
              height: 50,
              width: 300,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      foregroundColor: Colors.white),
                  onPressed: () {},
                  child: const Text(
                    'Edit Profile',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }

  Expanded buildExpanded() {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(10),
            child: ExpansionTile(
              title: const Text(
                '95t',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: const Text('Status: sucsses}'),
              children: [
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(),
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    // Add padding for better spacing
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Date',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Text(
                          '${202020}',
                        ),
                        SizedBox(height: 19),
                        Text(
                          'Product',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Text('dimond 100'),
                        SizedBox(height: 10),
                        Text(
                          'Prich',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Text('100'),
                        SizedBox(height: 10),
                        Text(
                          'Mesege',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Text(
                          'Plase your order',
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
