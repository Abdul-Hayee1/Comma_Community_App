// ignore_for_file: unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:comma_community_app/modules/main/profile/controller/profile_controller.dart';
import 'package:comma_community_app/providers/profile_provider.dart';
import 'package:comma_community_app/widgets/custom_post_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FeedScreen extends ConsumerStatefulWidget {
  const FeedScreen({super.key});

  @override
  ConsumerState<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends ConsumerState<FeedScreen> {
  late ProfileController profileController;
  late ProfileNotifier profileNotifier;
  final _postController = TextEditingController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      profileNotifier.getUserInfo();
      profileNotifier.startListeningToUserDetails();
    });
  }

  void createPost() {
    if (_postController.text.isNotEmpty) {
      FirebaseFirestore.instance.collection('User Posts').add({
        'author': profileController.userName,
        // 'role': profileController.role,
        'content': _postController.text,
        'timestamp': FieldValue.serverTimestamp(),
        'commentCount': 0,
        'likeCount': 0,
        // 'profileImage': profileController.profileImage,
      }).then((value) {
        _postController.clear();
      }).catchError((error) {
        print("Failed to add post: $error");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    profileController = ref.watch(profileNotifierProvider);
    profileNotifier = ref.read(profileNotifierProvider.notifier);

    return SingleChildScrollView(
      child: Column(
        children: [
          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('User Posts')
                // .orderBy('timestamp', descending: true)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }

              if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                return const Text("No posts found.",
                    style: TextStyle(color: Colors.white));
              }

              final docs = snapshot.data!.docs;

              return Column(
                children: docs.map((doc) {
                  final data = doc.data() as Map<String, dynamic>;
                  final post = Post.fromFirestore(data);
                  return PostWidget(post: post);
                }).toList(),
              );
            },
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
