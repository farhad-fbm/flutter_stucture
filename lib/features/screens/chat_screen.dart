import 'package:flutter/material.dart';

import '../../common_widgets/custom_navigation_bar.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(activeIndex: 2),
      appBar: AppBar(title: const Text('Chat Screen')),
      body: const Center(child: Text('This is the Chat Screen')),
    );
  }
}
