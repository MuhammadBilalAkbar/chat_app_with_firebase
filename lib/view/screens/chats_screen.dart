import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/user.dart';
import '../../provider/firebase_provider.dart';
import '../../service/notification_service.dart';
import '../widgets/user_item.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> with WidgetsBindingObserver {
  final notificationService = NotificationsService();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    Provider.of<FirebaseProvider>(context, listen: false).getAllUsers();
    notificationService.firebaseNotification(context);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  final userData = [
    const UserModel(
      uid: '1',
      name: 'Hazy',
      email: 'test@test.test',
      image: 'https://i.pravatar.cc/150?img=0',
    ),
    const UserModel(
      uid: '1',
      name: 'Charlotte',
      email: 'test@test.test',
      image: 'https://i.pravatar.cc/150?img=1',
    ),
    const UserModel(
      uid: '2',
      name: 'Ahmed',
      email: 'test@test.test',
      image: 'https://i.pravatar.cc/150?img=2',
    ),
    const UserModel(
      uid: '3',
      name: 'Prateek',
      email: 'test@test.test',
      image: 'https://i.pravatar.cc/150?img=3',
    ),
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Chats'),
          actions: [
            IconButton(
              onPressed: () => FirebaseAuth.instance.signOut(),
              icon: const Icon(Icons.logout, color: Colors.black),
            ),
          ],
        ),
        body: Consumer<FirebaseProvider>(
          builder: (context, value, child) {
            return ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: value.users.length,
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => value.users[index].uid !=
                      FirebaseAuth.instance.currentUser?.uid
                  ? UserItem(user: value.users[index])
                  : const SizedBox(),
            );
          },
        ),
      );
}
