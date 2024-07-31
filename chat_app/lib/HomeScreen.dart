import 'package:flutter/material.dart';
import 'ChatScreen.dart';
import 'DataSearch.dart';
import 'LoginScreen.dart';
import 'AddPersonScreen.dart';
import 'SettingsPage.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff292F3F),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  const Text(
                    "Messages",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      fontFamily: 'Quicksand',
                      color: Colors.white,
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          showSearch(
                            context: context,
                            delegate: DataSearch(),
                          );
                        },
                        icon: const Icon(
                          Icons.search,
                          color: Colors.white,
                          size: 36,
                        ),
                      ),
                      const SizedBox(width: 20),
                      PopupMenuButton<int>(
                        icon: const Icon(
                          Icons.more_vert,
                          color: Colors.white,
                          size: 36,
                        ),
                        onSelected: (item) => _onSelected(context, item),
                        itemBuilder: (context) => [
                          const PopupMenuItem<int>(
                            value: 0,
                            child: Text('Settings'),
                          ),
                          const PopupMenuItem<int>(
                            value: 1,
                            child: Text('Log Out'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: const [
                  _UserAvatar(name: 'Rahul', imagePath: 'assets/img/img_9.png', phone: '9876543210'),
                  SizedBox(width: 20),
                  _UserAvatar(name: 'Sandhya', imagePath: 'assets/img/img_2.png', phone: '8765432109'),
                  SizedBox(width: 20),
                  _UserAvatar(name: 'Aryan', imagePath: 'assets/img/img_3.png', phone: '7654321098'),
                  SizedBox(width: 20),
                  _UserAvatar(name: 'Nikhil', imagePath: 'assets/img/img_4.png', phone: '6543210987'),
                  SizedBox(width: 20),
                  _UserAvatar(name: 'Vivek', imagePath: 'assets/img/img_5.png', phone: '5432109876'),
                  SizedBox(width: 20),
                  _UserAvatar(name: 'Gautam', imagePath: 'assets/img/img_6.png', phone: '4321098765'),
                  SizedBox(width: 20),
                  _UserAvatar(name: 'Dheeraj', imagePath: 'assets/img/img_7.png', phone: '3210987654'),
                  SizedBox(width: 20),
                  _UserAvatar(name: 'Dev', imagePath: 'assets/img/img_8.png', phone: '2109876543'),
                  SizedBox(width: 20),
                  _UserAvatar(name: 'Sahil', imagePath: 'assets/img/img_10.png', phone: '1098765432'),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xff1B202D),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: ListView(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  children: const [
                    _MessageRow(
                      name: 'Rahul',
                      phone: '9876543210',
                      time: '12:15',
                      imagePath: 'assets/img/img_9.png',
                    ),
                    _MessageRow(
                      name: 'Sandhya',
                      phone: '8765432109',
                      time: '11:30',
                      imagePath: 'assets/img/img_2.png',
                    ),
                    _MessageRow(
                      name: 'Aryan',
                      phone: '7654321098',
                      time: '10:45',
                      imagePath: 'assets/img/img_3.png',
                    ),
                    _MessageRow(
                      name: 'Nikhil',
                      phone: '6543210987',
                      time: '09:30',
                      imagePath: 'assets/img/img_4.png',
                    ),
                    _MessageRow(
                      name: 'Vivek',
                      phone: '5432109876',
                      time: '08:15',
                      imagePath: 'assets/img/img_5.png',
                    ),
                    _MessageRow(
                      name: 'Gautam',
                      phone: '4321098765',
                      time: '07:45',
                      imagePath: 'assets/img/img_6.png',
                    ),
                    _MessageRow(
                      name: 'Dheeraj',
                      phone: '3210987654',
                      time: '07:00',
                      imagePath: 'assets/img/img_7.png',
                    ),
                    _MessageRow(
                      name: 'Dev',
                      phone: '2109876543',
                      time: '06:30',
                      imagePath: 'assets/img/img_8.png',
                    ),
                    _MessageRow(
                      name: 'Sahil',
                      phone: '1098765432',
                      time: '05:15',
                      imagePath: 'assets/img/img_10.png',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddPersonScreen()),
          );
        },
        backgroundColor: Color(0xff292F3F),
        child: const Icon(Icons.add),
        splashColor: Colors.red,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  void _onSelected(BuildContext context, int item) {
    switch (item) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SettingsPage()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
        break;
    }
  }
}

class _UserAvatar extends StatelessWidget {
  final String name;
  final String imagePath;
  final String phone;

  const _UserAvatar({
    required this.name,
    required this.imagePath,
    required this.phone,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatScreen(
              name: name,
              imagePath: imagePath,
              phone: phone,
            ),
          ),
        );
      },
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xff1B202D), width: 2),
                borderRadius: BorderRadius.all(Radius.circular(100)),
              ),
              child: CircleAvatar(
                radius: 35,
                backgroundImage: AssetImage(imagePath),
              ),
            ),
            const SizedBox(height: 5),
            Text(
              name,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

class _MessageRow extends StatelessWidget {
  final String name;
  final String phone;
  final String time;
  final String imagePath;

  const _MessageRow({
    required this.name,
    required this.phone,
    required this.time,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatScreen(
                name: name,
                imagePath: imagePath,
                phone: phone,
              ),
            ),
          );
        },
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(imagePath),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    phone,
                    style: const TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),
            Text(
              time,
              style: const TextStyle(color: Colors.white54),
            ),
          ],
        ),
      ),
    );
  }
}