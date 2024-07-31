import 'package:flutter/material.dart';

import 'Editprofile.dart';
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SettingsPage(),
    );
  }
}

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1B202D),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xff1B202D), size: 30),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Settings', style: TextStyle(color: Color(0xff1B202D), fontWeight: FontWeight.w700)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: IconButton(
              icon: Icon(Icons.search, color: Colors.black , size: 35, ),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/img/img.png'),
                    radius: 30,
                  ),
                  SizedBox(width: 16.0),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Editprofile()),
                      );
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'ᴍʀ.ᴏᴡɴᴇʀ...',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white70,
                          ),
                        ),
                        Text(
                          'SLEEPING',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Divider(
              height: 1,
              color: Colors.white,
            ),
            buildSettingItem(
              icon: Icon(Icons.key, color: Colors.white),
              title: 'Account',
              subtitle: 'Security notifications, change number',
            ),
            Divider(
              height: 1,
              color: Colors.white,
            ),
            buildSettingItem(
              icon: Icon(Icons.lock, color: Colors.white),
              title: 'Privacy',
              subtitle: 'Block contacts, disappearing messages',
            ),
            Divider(
              height: 1,
              color: Colors.white,
            ),
            buildSettingItem(
              icon: Icon(Icons.account_circle, color: Colors.white),
              title: 'Avatar',
              subtitle: 'Create, edit, profile photo',
            ),
            Divider(
              height: 1,
              color: Colors.white,
            ),
            buildSettingItem(
              icon: Icon(Icons.message, color: Colors.white),
              title: 'Chats',
              subtitle: 'Theme, wallpapers, chat history',
            ),
            Divider(
              height: 1,
              color: Colors.white,
            ),
            buildSettingItem(
              icon: Icon(Icons.notifications, color: Colors.white),
              title: 'Notifications',
              subtitle: 'Message, group & call tones',
            ),
            Divider(
              height: 1,
              color: Colors.white,
            ),
            buildSettingItem(
              icon: Icon(Icons.storage, color: Colors.white),
              title: 'Storage and data',
              subtitle: 'Network usage, auto-download',
            ),
            Divider(
              height: 1,
              color: Colors.white,
            ),
            buildSettingItem(
              icon: Icon(Icons.language, color: Colors.white),
              title: 'App language',
              subtitle: 'English (device’s language)',
            ),
            Divider(
              height: 1,
              color: Colors.white,
            ),
            buildSettingItem(
              icon: Icon(Icons.help, color: Colors.white),
              title: 'Help',
              subtitle: 'Help centre, contact us, privacy policy',
            ),
            Divider(
              height: 1,
              color: Colors.white,
            ),
            buildSettingItem(
              icon: Icon(Icons.person_add, color: Colors.white),
              title: 'Invite a friend',
            ),
            Divider(
              height: 1,
              color: Colors.white,
            ),
            buildSettingItem(
              icon: Icon(Icons.update, color: Colors.white),
              title: 'App updates',
            ),
          ],
        ),
      ),
    );
  }


  Widget buildSettingItem({
    required Icon icon,
    required String title,
    String? subtitle,
  }) {
    return ListTile(
      leading: icon,
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white70),
      ),
      subtitle: subtitle != null
          ? Text(subtitle, style: TextStyle(color: Colors.white70))
          : null,
      onTap: () {},
    );
  }
}