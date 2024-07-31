import 'package:flutter/material.dart';

import 'DataSearch.dart';

class ChatScreen extends StatefulWidget {
  final String name;
  final String imagePath;
  final String phone;
  final bool isEncrypted;

  const ChatScreen({
    Key? key,
    required this.name,
    required this.imagePath,
    required this.phone,
    this.isEncrypted = false,
  }) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<Message> _messages = [
    Message(text: 'Hello!', isSentByMe: false),
    Message(text: 'How are you?', isSentByMe: true),
    Message(text: 'I am good, thanks!', isSentByMe: false),
  ];

  void _sendMessage(String text) {
    if (text.isNotEmpty) {
      setState(() {
        _messages.insert(0, Message(text: text, isSentByMe: true));
        _controller.clear();
      });
    }
  }

  void _navigateToProfile() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProfilePage(
          name: widget.name,
          phone: widget.phone,
          imagePath: widget.imagePath,
        ),
      ),
    );
  }

  void _showImageDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Choose an option'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.camera),
                title: Text('Take a photo'),
                onTap: () {
                  _takeAPhoto();
                },
              ),
              ListTile(
                leading: Icon(Icons.image),
                title: Text('Choose from gallery'),
                onTap: () {
                  _chooseFromGallery();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _takeAPhoto() async {}

  void _chooseFromGallery() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1B202D),
      appBar: AppBar(
        title: Column(
          children: [
            Text(
              widget.name,
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Active now',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'viewProfile') {
                _navigateToProfile();
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem<String>(
                value: 'viewProfile',
                child: Row(
                  children: [
                    Icon(Icons.person),
                    SizedBox(width: 8),
                    Text('View Profile'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          if (widget.isEncrypted)
            Container(
              color: Colors.blueAccent,
              padding: EdgeInsets.symmetric(vertical: 8.0),
              alignment: Alignment.center,
              child: Text(
                'End-to-End Encrypted',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(8.0),
              reverse: true,
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return MessageWidget(
                  text: message.text,
                  isSentByMe: message.isSentByMe,
                  senderImagePath: widget.imagePath,
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.camera_alt, color: Colors.white),
                  onPressed: _showImageDialog,
                ),
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send, color: Colors.white),
                  onPressed: () {
                    _sendMessage(_controller.text);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Message {
  final String text;
  final bool isSentByMe;

  Message({
    required this.text,
    required this.isSentByMe,
  });
}

class MessageWidget extends StatelessWidget {
  final String text;
  final bool isSentByMe;
  final String senderImagePath;

  const MessageWidget({
    Key? key,
    required this.text,
    required this.isSentByMe,
    required this.senderImagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: isSentByMe ? null : CircleAvatar(
        backgroundImage: AssetImage(senderImagePath),
      ),
      trailing: isSentByMe ? CircleAvatar(
        backgroundImage: AssetImage(senderImagePath),
      ) : null,
      title: Align(
        alignment: isSentByMe ? Alignment.centerRight : Alignment.centerLeft,
        child: Container(
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: isSentByMe ? Colors.blue : Colors.grey[200],
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Text(
            text,
            style: TextStyle(color: isSentByMe ? Colors.white : Colors.black),
          ),
        ),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  final String name;
  final String phone;
  final String imagePath;

  const ProfilePage({
    Key? key,
    required this.name,
    required this.phone,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1B202D),
      appBar: AppBar(
        backgroundColor: const Color(0xff292F3F),
        title: const Text(
          'Profile',
          style: TextStyle(
            color: Colors.grey,
            decoration: TextDecoration.underline,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Center(
                child: CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage(imagePath),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                name,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                phone,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white70,
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton.icon(
                onPressed: () {
                  // Add functionality to mute notification
                },
                icon: Icon(Icons.notifications_off, color: Colors.grey),
                label: const Text(
                  'Mute Notification',
                  style: TextStyle(color: Colors.grey),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff292F3F),
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Add functionality to block
                },
                child: const Text(
                  'Block',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff292F3F),
      endDrawer: _buildCompactEndDrawer(context),
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
                      Builder(
                        builder: (context) => IconButton(
                          onPressed: () {
                            Scaffold.of(context).openEndDrawer();
                          },
                          icon: const Icon(
                            Icons.more_vert,
                            color: Colors.white,
                            size: 36,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: const [
                  _UserAvatar(name: 'Rahul', imagePath: 'assets/img/img_9.png', phone: '1234567890'),
                  _UserAvatar(name: 'Deepak', imagePath: 'assets/img/img_5.png', phone: '9876543210'),
                  _UserAvatar(name: 'Kumar', imagePath: 'assets/img/img_6.png', phone: '5555555555'),
                  _UserAvatar(name: 'Amit', imagePath: 'assets/img/img_8.png', phone: '4444444444'),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Text(
                "Recent Chats",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: ListView(
                children: const [
                  _MessageRow(name: 'Rahul', imagePath: 'assets/img/img_9.png', phone: '1234567890'),
                  _MessageRow(name: 'Deepak', imagePath: 'assets/img/img_5.png', phone: '9876543210'),
                  _MessageRow(name: 'Kumar', imagePath: 'assets/img/img_6.png', phone: '5555555555'),
                  _MessageRow(name: 'Amit', imagePath: 'assets/img/img_8.png', phone: '4444444444'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCompactEndDrawer(BuildContext context) {
    return Container(
      width: 250,
      color: const Color(0xff292F3F),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Settings",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.person, color: Colors.white),
                  title: Text(
                    "Profile",
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                  },
                ),
                ListTile(
                  leading: Icon(Icons.lock, color: Colors.white),
                  title: Text(
                    "Privacy",
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    // Add navigation to Privacy Page
                  },
                ),
                ListTile(
                  leading: Icon(Icons.settings, color: Colors.white),
                  title: Text(
                    "Settings",
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _UserAvatar extends StatelessWidget {
  final String name;
  final String imagePath;
  final String phone;

  const _UserAvatar({
    Key? key,
    required this.name,
    required this.imagePath,
    required this.phone,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Column(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage(imagePath),
          ),
          const SizedBox(height: 8),
          Text(
            name,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            phone,
            style: const TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

class _MessageRow extends StatelessWidget {
  final String name;
  final String imagePath;
  final String phone;

  const _MessageRow({
    Key? key,
    required this.name,
    required this.imagePath,
    required this.phone,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(imagePath),
      ),
      title: Text(
        name,
        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        phone,
        style: const TextStyle(color: Colors.grey),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatScreen(
              name: name,
              imagePath: imagePath,
              phone: phone,
              isEncrypted: true, // Pass true to show the "End-to-End Encrypted" message
            ),
          ),
        );
      },
    );
  }
}