import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage('https://via.placeholder.com/150'),
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Admin Yeamen',
                        style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                      ),
                      Text('helo@gamil.com')
                    ],
                  ),
                ],
              ),
            ),
            const Divider(thickness: 1),
            const ListTile(
              leading: CircleAvatar(child: Icon(Icons.call)),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Phone'),
                  Text('not saved', style: TextStyle(color: Colors.grey)),
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
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildStatItem('Total Order', '1', Colors.blue),
                      _buildStatItem('Order Confirm', '1', Colors.green),
                    ],
                  ),
                  SizedBox(height: 10),
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
            const ListTile(
              leading: CircleAvatar(child: Icon(Icons.dark_mode)),
              title: Text('Dark Mode'),
            ),
            const ListTile(
              leading: CircleAvatar(child: Icon(Icons.exit_to_app_rounded)),
              title: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(String label, String value, Color color) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: color),
        ),
        Text(
          label,
          style: TextStyle(color: color),
        ),
      ],
    );
  }
}
