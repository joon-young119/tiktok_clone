import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        elevation: 1,
        title: const Text("메시지"),
      ),
      body: ListView(
        children: [
          ListTile(

            
          )
        ],
      ),
    );
  }
}