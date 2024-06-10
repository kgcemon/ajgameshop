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
        title: Text('AJ Gameshop'),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.edit))],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(''),
                ),
                SizedBox(
                  width: 16,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Admin Yeamen',
                      style:
                          TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                    ),
                    Text('helo@gamil.com')
                  ],
                ),
              ],
            ),
          ),
          Divider(
            thickness: 1,
          ),
          ListTile(
            leading: CircleAvatar(
              child: Icon(Icons.call),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text('Phone'), Text('not save')],
            ),
          ),
          Divider(
            thickness: 2,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 13),
            height: MediaQuery.of(context).size.height * 0.20,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey.shade300,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 6,
                ),
                Text(
                  'My Stats',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text(
                          '1',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue),
                        ),
                        Text(
                          'Total Order',
                          style: TextStyle(color: Colors.blue),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          '1',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.green),
                        ),
                        Text(
                          'Order Confirm',
                          style: TextStyle(color: Colors.green),
                        )
                      ],
                    )
                  ],
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text(
                          '1',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.amber),
                        ),
                        Text(
                          'Order Pending',
                          style: TextStyle(color: Colors.amber),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          '1',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.red),
                        ),
                        Text(
                          'Order   Cansell ',
                          style: TextStyle(color: Colors.red),
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          Divider(
            thickness: 2,
          ),
          ListTile(
            leading: CircleAvatar(child: Icon(Icons.lock)),
            title: Text('Reset Password'),
          ),
          ListTile(
            leading: CircleAvatar(child: Icon(Icons.circle)),
            title: Text('Terms & Conditions'),
          ),
          ListTile(
            leading: CircleAvatar(child: Icon(CupertinoIcons.link)),
            title: Text('Privacy Policy'),
          ),
          ListTile(
            leading: CircleAvatar(child: Icon(Icons.dark_mode)),
            title: Text('Dark Mode'),
          ),
          ListTile(
            leading: CircleAvatar(child: Icon(Icons.exit_to_app_rounded)),
            title: Text('Logout'),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.h_mobiledata), label: 'fj'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.h_mobiledata,
              ),
              label: 'jdf')
        ],
      ),
    );
  }
}