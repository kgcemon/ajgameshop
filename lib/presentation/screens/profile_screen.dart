import 'package:ajgameshop/presentation/screens/auth/signIn_screen.dart';
import 'package:ajgameshop/presentation/state_holders/profile_controller.dart';
import 'package:ajgameshop/presentation/state_holders/user_auth_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Profile'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.edit),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: GetBuilder<ProfileController>(
          builder: (controller) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(controller
                              .userDataFromApi?.img ??
                          'https://png.pngtree.com/thumb_back/fh260/background/20230527/pngtree-in-the-style-of-bold-character-designs-image_2697064.jpg'),
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.userDataFromApi!.name,
                          style: const TextStyle(
                              fontSize: 19, fontWeight: FontWeight.bold),
                        ),
                        Text(controller.userDataFromApi?.email ?? "")
                      ],
                    ),
                  ],
                ),
              ),
              const Divider(thickness: 1),
              ListTile(
                leading: const CircleAvatar(child: Icon(Icons.call)),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Phone'),
                    Text(controller.userDataFromApi?.phone ?? 'not saved',
                        style: const TextStyle(color: Colors.grey)),
                  ],
                ),
              ),
              const Divider(thickness: 2),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade300,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'My Stats',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildStatItem('Total Order', '1', Colors.blue),
                        _buildStatItem('Order Confirm', '1', Colors.green),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildStatItem('Order Pending', '1', Colors.amber),
                        _buildStatItem('Order Cancel', '1', Colors.red),
                      ],
                    ),
                  ],
                ),
              ),
              const Divider(thickness: 2),
              const ListTile(
                leading: CircleAvatar(child: Icon(Icons.lock)),
                title: Text('Reset Password'),
              ),
              const ListTile(
                leading: CircleAvatar(child: Icon(Icons.quick_contacts_dialer)),
                title: Text('Terms & Conditions'),
              ),
              const ListTile(
                leading: CircleAvatar(child: Icon(CupertinoIcons.link)),
                title: Text('Privacy Policy'),
              ),
               ListTile(
                onTap: () {
                  UserAuthController.clearUserData();
                  Get.offAll(()=> const LoginScreen());
                },
                leading: const CircleAvatar(child: Icon(Icons.exit_to_app_rounded)),
                title: const Text('Logout'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatItem(String label, String value, Color color) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: color),
        ),
        Text(
          label,
          style: TextStyle(color: color),
        ),
      ],
    );
  }
}
