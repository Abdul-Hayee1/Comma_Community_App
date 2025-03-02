import 'package:comma_community_app/widgets/my_button.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});

  final List<Map<String, String>> users = [
    {
      'firstName': 'Abdul',
      'lastName': 'Hayee',
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
                onPressed: () {},
                bgcolor: Colors.blue,
                isOutlined: false)
          ],
        ),
      ),
    );
  }
}
