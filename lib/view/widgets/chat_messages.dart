import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../model/message.dart';
import '../../provider/firebase_provider.dart';
import 'empty_widget.dart';
import 'message_bubble.dart';

class ChatMessages extends StatelessWidget {
  ChatMessages({super.key, required this.receiverId});

  final String receiverId;

  final messages = [
    Message(
      senderId: '2',
      receiverId: 'gNfEHSQZ5ZUcY6JG5AarK8O0SVw1',
      content: 'Hello',
      sentTime: DateTime.now(),
    ),
    Message(
      senderId: 'gNfEHSQZ5ZUcY6JG5AarK8O0SVw1',
      receiverId: '2',
      content: 'How are you?',
      sentTime: DateTime.now(),
    ),
    Message(
      senderId: '2',
      receiverId: 'gNfEHSQZ5ZUcY6JG5AarK8O0SVw1',
      content: 'Fine',
      sentTime: DateTime.now(),
    ),
    Message(
      senderId: 'gNfEHSQZ5ZUcY6JG5AarK8O0SVw1',
      receiverId: '2',
      content: 'What are you doing?',
      sentTime: DateTime.now(),
    ),
    Message(
      senderId: '2',
      receiverId: 'gNfEHSQZ5ZUcY6JG5AarK8O0SVw1',
      content: 'Nothing',
      sentTime: DateTime.now(),
    ),
    Message(
      senderId: 'gNfEHSQZ5ZUcY6JG5AarK8O0SVw1',
      receiverId: '2',
      content: 'Can you help me?',
      sentTime: DateTime.now(),
    ),
    Message(
      senderId: '2',
      receiverId: 'gNfEHSQZ5ZUcY6JG5AarK8O0SVw1',
      content:
          'https://images.unsplash.com/photo-1669992755631-3c46eccbeb7d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxMHx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60',
      sentTime: DateTime.now(),
    ),
    Message(
      senderId: 'gNfEHSQZ5ZUcY6JG5AarK8O0SVw1',
      receiverId: '2',
      content: 'Thank you',
      sentTime: DateTime.now(),
    ),
    Message(
      senderId: '2',
      receiverId: 'gNfEHSQZ5ZUcY6JG5AarK8O0SVw1',
      content: 'You are welcome',
      sentTime: DateTime.now(),
    ),
    Message(
      senderId: 'gNfEHSQZ5ZUcY6JG5AarK8O0SVw1',
      receiverId: '2',
      content: 'Bye',
      sentTime: DateTime.now(),
    ),
    Message(
      senderId: '2',
      receiverId: 'gNfEHSQZ5ZUcY6JG5AarK8O0SVw1',
      content: 'Bye',
      sentTime: DateTime.now(),
    ),
    Message(
      senderId: 'gNfEHSQZ5ZUcY6JG5AarK8O0SVw1',
      receiverId: '2',
      content: 'See you later',
      sentTime: DateTime.now(),
    ),
    Message(
      senderId: '2',
      receiverId: 'gNfEHSQZ5ZUcY6JG5AarK8O0SVw1',
      content: 'See you later',
      sentTime: DateTime.now(),
    )
  ];

  @override
  Widget build(BuildContext context) => Consumer<FirebaseProvider>(
        builder: (context, value, child) => value.messages.isEmpty
            ? const Expanded(
                child: EmptyWidget(icon: Icons.waving_hand, text: 'Say Hello!'),
              )
            : Expanded(
                child: ListView.builder(
                  controller:
                      Provider.of<FirebaseProvider>(context, listen: false)
                          .scrollController,
                  itemCount: value.messages.length,
                  itemBuilder: (context, index) {
                    final isMe = receiverId != value.messages[index].senderId;
                    return MessageBubble(
                      isMe: isMe,
                      message: value.messages[index],
                    );
                  },
                ),
              ),
      );
}
