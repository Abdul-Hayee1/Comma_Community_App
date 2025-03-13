import 'package:comma_community_app/widgets/bottom_modal_sheets.dart';
import 'package:comma_community_app/widgets/my_button.dart';
import 'package:comma_community_app/modules/main/chat/view/conversation_screen.dart';
import 'package:flutter/material.dart';

final List<Map<String, String>> users = [
  {
    'firstName': 'Firas',
    'lastName': 'Asher',
    'image': 'https://randomuser.me/api/portraits/men/1.jpg'
  },
  {
    'firstName': 'Shadi',
    'lastName': 'Fallahr',
    'image': 'https://randomuser.me/api/portraits/women/2.jpg'
  },
  {
    'firstName': 'Miriam',
    'lastName': 'Adebibe',
    'image': 'https://randomuser.me/api/portraits/women/3.jpg'
  },
  {
    'firstName': 'Katarzyna',
    'lastName': 'Stabiak',
    'image': 'https://randomuser.me/api/portraits/women/4.jpg'
  },
  {
    'firstName': 'Kara',
    'lastName': 'Lekuse',
    'image': 'https://randomuser.me/api/portraits/women/5.jpg'
  },
  {
    'firstName': 'Jules',
    'lastName': 'Beaven',
    'image': 'https://randomuser.me/api/portraits/men/6.jpg'
  },
  {
    'firstName': 'Lucas',
    'lastName': 'Bennett',
    'image': 'https://randomuser.me/api/portraits/men/7.jpg'
  },
  {
    'firstName': 'Emma',
    'lastName': 'Johansson',
    'image': 'https://randomuser.me/api/portraits/women/8.jpg'
  },
  {
    'firstName': 'Ethan',
    'lastName': 'Roberts',
    'image': 'https://randomuser.me/api/portraits/men/9.jpg'
  },
  {
    'firstName': 'Sophia',
    'lastName': 'Carter',
    'image': 'https://randomuser.me/api/portraits/women/10.jpg'
  },
  {
    'firstName': 'Daniel',
    'lastName': 'Smith',
    'image': 'https://randomuser.me/api/portraits/men/11.jpg'
  },
  {
    'firstName': 'Olivia',
    'lastName': 'Martin',
    'image': 'https://randomuser.me/api/portraits/women/12.jpg'
  },
];

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            const SizedBox(height: 10),
            SizedBox(
              height: 105,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: users.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundImage:
                                  NetworkImage(users[index]['image']!),
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
                                  border:
                                      Border.all(color: Colors.black, width: 2),
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
                                users[index]['firstName']!,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 14),
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                              Text(
                                users[index]['lastName']!,
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
                isOutlined: false)
          ],
        ),
      ),
    );
  }
}

class ChatContact_ListModal extends StatefulWidget {
  const ChatContact_ListModal({super.key});

  @override
  ChatContact_ListModalState createState() => ChatContact_ListModalState();
}

class ChatContact_ListModalState extends State<ChatContact_ListModal> {
  List<bool> selectedContacts = List.generate(users.length, (index) => false);
  TextEditingController searchController = TextEditingController();

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
                      child: const Icon(Icons.close, color: Colors.white)),
                  const Text(
                    "Start a Chat",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      showConversationBottomModal(context);
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
                          fontWeight: FontWeight.bold),
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
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  backgroundImage:
                                      NetworkImage(users[index]['image']!),
                                  radius: 16,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  "${users[index]['firstName']} ${users[index]['lastName']}",
                                  style: const TextStyle(color: Colors.white),
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
