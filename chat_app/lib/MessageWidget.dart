import 'package:flutter/material.dart';

// Define a simple message widget for displaying messages
class MessageWidget extends StatelessWidget {
  final String text;
  final bool isSentByMe;

  const MessageWidget({
    Key? key,
    required this.text,
    required this.isSentByMe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: isSentByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (!isSentByMe)
            CircleAvatar(
              backgroundImage: AssetImage('assets/img.png'),
              radius: 16.0,
            ),
          SizedBox(width: 8.0),
          Container(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
            decoration: BoxDecoration(
              color: isSentByMe ? Colors.blueAccent : Colors.grey[300],
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Text(
              text,
              style: TextStyle(color: isSentByMe ? Colors.white : Colors.black),
            ),
          ),
          if (isSentByMe)
            SizedBox(width: 8.0),
          if (isSentByMe)
            CircleAvatar(
              backgroundImage: AssetImage('assets/img.png'),
              radius: 16.0,
            ),
        ],
      ),
    );
  }
}

class ChatScreen extends StatefulWidget {
  final String name;
  final String imagePath;
  final bool isEncrypted;

  const ChatScreen({
    Key? key,
    required this.name,
    required this.imagePath,
    this.isEncrypted = true,
  }) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<Message> _messages = []; // List to store messages

  @override
  void initState() {
    super.initState();
    _loadPreviousMessages();
  }

  void _loadPreviousMessages() {
    setState(() {
      _messages.addAll([
        Message(text: 'How are you?', isSentByMe: true),
        Message(text: 'Hi there', isSentByMe: false),
        Message(text: 'Hello', isSentByMe: true),
      ]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
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
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
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

  void _sendMessage(String message) {
    if (message.trim().isEmpty) return;
    setState(() {
      _messages.insert(0, Message(text: message, isSentByMe: true));
    });
    _controller.clear();
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
