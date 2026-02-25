import 'package:flutter/material.dart';
import '../ai/ai_router.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, String>> _messages = [];
  final AIRouter _router = AIRouter(); // اتصال به مغز بنجامین

  void _sendMessage() {
    if (_controller.text.isEmpty) return;
    
    String userText = _controller.text;
    setState(() {
      _messages.add({"sender": "user", "text": userText});
    });

    // دریافت پاسخ از روتر هوشمند
    String response = _router.handleMessage(userText);

    setState(() {
      _messages.add({"sender": "benjamin", "text": response});
    });

    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1A1A2E), // تم تاریک و رمانتیک
      appBar: AppBar(
        title: Text("Beny Romance", style: TextStyle(color: Colors.pinkAccent)),
        backgroundColor: Color(0xFF16213E),
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                bool isUser = _messages[index]["sender"] == "user";
                return Align(
                  alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: isUser ? Colors.pinkAccent : Color(0xFF0F3460),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      _messages[index]["text"]!,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                );
              },
            ),
          ),
          _buildInputArea(),
        ],
      ),
    );
  }

  Widget _buildInputArea() {
    return Container(
      padding: EdgeInsets.all(12),
      color: Color(0xFF16213E),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "چیزی بنویس عزیزم...",
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none,
              ),
              onSubmitted: (_) => _sendMessage(),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send, color: Colors.pinkAccent),
            onPressed: _sendMessage,
          ),
        ],
      ),
    );
  }
}
