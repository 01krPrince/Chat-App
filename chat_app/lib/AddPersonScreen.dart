import 'package:flutter/material.dart';

class AddPersonScreen extends StatelessWidget {
  const AddPersonScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff292F3F),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back , size: 30,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Select contact', style: TextStyle(color: Color(0xff292F3F), fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search , size: 32,),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert , size: 30,),
          ),
        ],
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const CircleAvatar(
              backgroundColor: Colors.green,
              child: Icon(Icons.group_add),
            ),
            title: const Text('New group', style: TextStyle(color: Colors.white)),
          ),
          ListTile(
            leading: const CircleAvatar(
              backgroundColor: Colors.green,
              child: Icon(Icons.person_add),
            ),
            title: const Text('New contact', style: TextStyle(color: Colors.white)),
            trailing: const Icon(Icons.qr_code_scanner , color: Colors.grey,),
          ),
          ListTile(
            leading: const CircleAvatar(
              backgroundColor: Colors.green,
              child: Icon(Icons.people),
            ),
            title: const Text('New community', style: TextStyle(color: Colors.white)),
          ),
          const SizedBox(height: 16),
          const Text('Contacts on ChatApp', style: TextStyle(color: Colors.grey)),
          ListTile(
            leading: CircleAvatar(
              backgroundImage:
              const AssetImage('assets/img/img.png'),
            ),
            title: const Text('~PRINCE KR', style: TextStyle(color: Colors.white)),
            subtitle: const Text('Message yourself', style: TextStyle(color: Colors.white)),
            trailing: const Icon(Icons.emoji_emotions , color: Colors.grey,),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundImage:
              const AssetImage('assets/images/profile_picture.jpg'),
            ),
            title: const Text('~Ravi Bhai', style: TextStyle(color: Colors.white)),
            subtitle: const Text('Can’t talk, ChatApp only', style: TextStyle(color: Colors.white)),
            trailing: const Icon(Icons.sentiment_satisfied , color: Colors.grey,),
          ),
          ListTile(
            leading: const CircleAvatar(
              child: Icon(Icons.person),
            ),
            title: const Text('~Rahul Sinha', style: TextStyle(color: Colors.white)),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundImage:
              const AssetImage('assets/images/profile_picture.jpg'),
            ),
            title: const Text('~Ritik Singh', style: TextStyle(color: Colors.white)),
            subtitle: const Text('Hey there! I am using ChatApp.', style: TextStyle(color: Colors.white)),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundImage:
              const AssetImage('assets/images/profile_picture.jpg'),
            ),
            title: const Text('~Abhishek Bhaiya', style: TextStyle(color: Colors.white)),
            subtitle: const Text('Guddu Pandit', style: TextStyle(color: Colors.white)),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundImage:
              const AssetImage('assets/images/profile_picture.jpg'),
            ),
            title: const Text('~Gaurav Bhaiya', style: TextStyle(color: Colors.white)),
            subtitle: const Text('Bholu bhaiya', style: TextStyle(color: Colors.white)),
          ),
          ListTile(
            leading: const CircleAvatar(
              child: Icon(Icons.person),
            ),
            title: const Text('~Aman Roy', style: TextStyle(color: Colors.white)),
            subtitle: const Text("Can't talk ChatApp only", style: TextStyle(color: Colors.white)),
          ),
          ListTile(
            leading: const CircleAvatar(
              child: Icon(Icons.person),
            ),
            title: const Text('~Anshal', style: TextStyle(color: Colors.white)),
            subtitle: const Text("a.nsh@l.gmail.com", style: TextStyle(color: Colors.white)),
            trailing: const Icon(Icons.star , color: Colors.grey,),
          ),
          ListTile(
            leading: const CircleAvatar(
              child: Icon(Icons.person),
            ),
            title: const Text('~Saurav', style: TextStyle(color: Colors.white)),
            subtitle: const Text("(┬┬﹏┬┬)", style: TextStyle(color: Colors.white)),
            trailing: ElevatedButton(
              child: Text('Add Friend'),
              onPressed: () {
                print('Add friend button pressed');
              },
            ),
          ),
          ListTile(
            leading: const CircleAvatar(
              child: Icon(Icons.person),
            ),
            title: const Text('~Ayush', style: TextStyle(color: Colors.white)),
            subtitle: const Text("🤖🤖", style: TextStyle(color: Colors.white)),
            trailing: ElevatedButton(
              child: Text('Add Friend'),
              onPressed: () {
                print('Add friend button pressed');
              },
            ),
          ),
          ListTile(
            leading: const CircleAvatar(
              child: Icon(Icons.person),
            ),
            title: const Text('~Ayush', style: TextStyle(color: Colors.white)),
            subtitle: const Text("🤖🤖", style: TextStyle(color: Colors.white)),
            trailing: ElevatedButton(
              child: Text('Add Friend'),
              onPressed: () {
                print('Add friend button pressed');
              },
            ),
          ),
          ListTile(
            leading: const CircleAvatar(
              child: Icon(Icons.person),
            ),
            title: const Text('~Ayush', style: TextStyle(color: Colors.white)),
            subtitle: const Text("🤖🤖", style: TextStyle(color: Colors.white)),
            trailing: ElevatedButton(
              child: Text('Add Friend'),
              onPressed: () {
                print('Add friend button pressed');
              },
            ),
          )
          ,ListTile(
            leading: const CircleAvatar(
              child: Icon(Icons.person),
            ),
            title: const Text('~Ayush', style: TextStyle(color: Colors.white)),
            subtitle: const Text("🤖🤖", style: TextStyle(color: Colors.white)),
            trailing: ElevatedButton(
              child: Text('Add Friend'),
              onPressed: () {
                print('Add friend button pressed');
              },
            ),
          ),
          ListTile(
            leading: const CircleAvatar(
              child: Icon(Icons.person),
            ),
            title: const Text('~Ayush', style: TextStyle(color: Colors.white)),
            subtitle: const Text("🤖🤖", style: TextStyle(color: Colors.white)),
            trailing: ElevatedButton(
              child: Text('Add Friend'),
              onPressed: () {
                print('Add friend button pressed');
              },
            ),
          ),
          ListTile(
            leading: const CircleAvatar(
              child: Icon(Icons.person),
            ),
            title: const Text('~Ayush', style: TextStyle(color: Colors.white)),
            subtitle: const Text("🤖🤖", style: TextStyle(color: Colors.white)),
            trailing: ElevatedButton(
              child: Text('Add Friend'),
              onPressed: () {
                print('Add friend button pressed');
              },
            ),
          ),
          ListTile(
            leading: const CircleAvatar(
              child: Icon(Icons.person),
            ),
            title: const Text('~Ayush', style: TextStyle(color: Colors.white)),
            subtitle: const Text("🤖🤖", style: TextStyle(color: Colors.white)),
            trailing: ElevatedButton(
              child: Text('Add Friend'),
              onPressed: () {
                print('Add friend button pressed');
              },
            ),
          ),
          ListTile(
            leading: const CircleAvatar(
              child: Icon(Icons.person),
            ),
            title: const Text('~Ayush', style: TextStyle(color: Colors.white)),
            subtitle: const Text("🤖🤖", style: TextStyle(color: Colors.white)),
            trailing: ElevatedButton(
              child: Text('Add Friend'),
              onPressed: () {
                print('Add friend button pressed');
              },
            ),
          ),
          ListTile(
            leading: const CircleAvatar(
              child: Icon(Icons.person),
            ),
            title: const Text('~Ayush', style: TextStyle(color: Colors.white)),
            subtitle: const Text("🤖🤖", style: TextStyle(color: Colors.white)),
            trailing: ElevatedButton(
              child: Text('Add Friend'),
              onPressed: () {
                print('Add friend button pressed');
              },
            ),
          ),
          ListTile(
            leading: const CircleAvatar(
              child: Icon(Icons.person),
            ),
            title: const Text('~Ayush', style: TextStyle(color: Colors.white)),
            subtitle: const Text("🤖🤖", style: TextStyle(color: Colors.white)),
            trailing: ElevatedButton(
              child: Text('Add Friend'),
              onPressed: () {
                print('Add friend button pressed');
              },
            ),
          ),
          ListTile(
            leading: const CircleAvatar(
              child: Icon(Icons.person),
            ),
            title: const Text('~Ayush', style: TextStyle(color: Colors.white)),
            subtitle: const Text("🤖🤖", style: TextStyle(color: Colors.white)),
            trailing: ElevatedButton(
              child: Text('Add Friend'),
              onPressed: () {
                print('Add friend button pressed');
              },
            ),
          ),
          ListTile(
            leading: const CircleAvatar(
              child: Icon(Icons.person),
            ),
            title: const Text('~Ayush', style: TextStyle(color: Colors.white)),
            subtitle: const Text("🤖🤖", style: TextStyle(color: Colors.white)),
            trailing: ElevatedButton(
              child: Text('Add Friend'),
              onPressed: () {
                print('Add friend button pressed');
              },
            ),
          ),
        ],
      ),
    );
  }
}