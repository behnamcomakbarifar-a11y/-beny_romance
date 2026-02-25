import 'package:flutter/material.dart';
import 'ui/chat_screen.dart';

void main() {
  runApp(BenyRomanceApp());
}

class BenyRomanceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Beny Romance',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ChatScreen(),
    );
  }
}
