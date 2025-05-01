import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:comma_community_app/modules/main/chat/view/conversation_screen.dart';
import 'package:comma_community_app/widgets/bottom_modal_sheets.dart';
import 'package:comma_community_app/widgets/my_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatScreen extends ConsumerWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUserId = FirebaseAuth.instance.currentUser?.uid ?? '';

    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('users').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const Center(
            child: Text(
              'No users found.',
              style: TextStyle(color: Colors.white),
            ),
          );
        }

        final allUsers = snapshot.data!.docs
            .where((doc) => doc.id != currentUserId)
            .toList();

        return SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 10),
                SizedBox(
                  height: 105,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: allUsers.length,
                    itemBuilder: (context, index) {
                      final userData = allUsers[index];
                      final firstName = userData['firstName'] ?? '';
                      final lastName = userData['lastName'] ?? '';
                      final imageUrl = userData['profilePhoto'] ?? '';

                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                CircleAvatar(
                                  backgroundImage: NetworkImage(imageUrl),
                                  radius: 30,
                                ),
                                Positioned(
                                  bottom: 2,
                                  right: 2,
                                  child: Container(
                                    width: 14,
                                    height: 14,
                                    decoration: BoxDecoration(
                                      color: Colors.green,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: Colors.black, width: 2),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            SizedBox(
                              width: 60,
                              child: Column(
                                children: [
                                  Text(
                                    firstName,
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 14),
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                  Text(
                                    lastName,
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 14),
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Divider(
                  color: Colors.grey[800],
                  thickness: 1,
                ),
                const SizedBox(height: 70),
                const Icon(Icons.chat, size: 30, color: Colors.white),
                const SizedBox(height: 15),
                const Text(
                  'There are no active chats.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 15),
                MyButton(
                  hintText: 'Add a Chat',
                  onPressed: () {
                    showAddNewChatModal(context);
                  },
                  bgcolor: Colors.blue,
                  isOutlined: false,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class ChatContactListModal extends ConsumerStatefulWidget {
  const ChatContactListModal({super.key});

  @override
  ChatContactListModalState createState() => ChatContactListModalState();
}

class ChatContactListModalState extends ConsumerState<ChatContactListModal> {
  TextEditingController searchController = TextEditingController();
  List<bool> selectedContacts = [];

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.93,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 5.0, left: 10, right: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.close, color: Colors.white),
                  ),
                  const Text(
                    "Start a Chat",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      final snapshot = await FirebaseFirestore.instance
                          .collection('users')
                          .get();
                      final users = snapshot.docs;

                      final selectedIndex = selectedContacts
                          .indexWhere((isSelected) => isSelected);
                      if (selectedIndex == -1) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Please select a user")),
                        );
                        return;
                      }

                      final selectedUserData = users[selectedIndex].data();
                      final currentUserId =
                          FirebaseAuth.instance.currentUser?.uid;

                      if (currentUserId == null) return;

                      final currentUserSnapshot = await FirebaseFirestore
                          .instance
                          .collection('users')
                          .doc(currentUserId)
                          .get();

                      final currentUserData = currentUserSnapshot.data();

                      if (currentUserData == null) return;

                      showConversationBottomModal(
                        context,
                        currentUserId: currentUserId,
                        otherUserId: users[selectedIndex].id,
                        otherUserName:
                            "${selectedUserData['firstName']} ${selectedUserData['lastName']}",
                        otherUserImageUrl:
                            selectedUserData['profilePhoto'] ?? "",
                        currentUserName:
                            "${currentUserData['firstName']} ${currentUserData['lastName']}",
                        currentUserImageUrl:
                            currentUserData['profilePhoto'] ?? "",
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      minimumSize: const Size(40, 30),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 6),
                    ),
                    child: Text(
                      "Next",
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              TextField(
                controller: searchController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[800],
                  hintText: "Search",
                  hintStyle: const TextStyle(color: Colors.white70),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                ),
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: Theme(
                  data: Theme.of(context).copyWith(
                    checkboxTheme: const CheckboxThemeData(
                      side: BorderSide(color: Colors.grey, width: 2),
                    ),
                  ),
                  child: FutureBuilder<QuerySnapshot>(
                    future:
                        FirebaseFirestore.instance.collection('users').get(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      }

                      if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                        return const Center(child: Text('No users found.'));
                      }

                      final users = snapshot.data!.docs;

                      // Initialize selectedContacts if not already initialized
                      if (selectedContacts.length != users.length) {
                        selectedContacts =
                            List.generate(users.length, (index) => false);
                      }

                      return ListView.builder(
                        itemCount: users.length,
                        itemBuilder: (context, index) {
                          final user =
                              users[index].data() as Map<String, dynamic>;

                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    user['profilePhoto'] != null &&
                                            user['profilePhoto']
                                                .toString()
                                                .isNotEmpty
                                        ? CircleAvatar(
                                            backgroundImage: NetworkImage(
                                              user['profilePhoto'],
                                            ),
                                            radius: 16,
                                          )
                                        : const CircleAvatar(
                                            backgroundColor: Colors.grey,
                                            radius: 16,
                                            child: Icon(Icons.person,
                                                color: Colors.white),
                                          ),
                                    const SizedBox(width: 10),
                                    Text(
                                      "${user['firstName']} ${user['lastName']}",
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                                Checkbox(
                                  value: selectedContacts[index],
                                  onChanged: (bool? value) {
                                    setState(() {
                                      selectedContacts[index] = value!;
                                    });
                                  },
                                  checkColor: Colors.blueAccent,
                                  activeColor: Colors.transparent,
                                  side: BorderSide(
                                    color: selectedContacts[index]
                                        ? Colors.blueAccent
                                        : Colors.grey,
                                    width: 2,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
