import 'package:flutter/material.dart';

class IndividualChatScreen extends StatelessWidget {
  final String chatParticipantName;

  const IndividualChatScreen({super.key, required this.chatParticipantName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(chatParticipantName),
      ),
      body: const Center(
        child: Text('Individual Chat Screen Content'),
      ),
    );
  }
}
