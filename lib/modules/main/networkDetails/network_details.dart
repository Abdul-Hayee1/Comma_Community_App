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

class NetworkPage extends StatelessWidget {
  const NetworkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 35, 40, 50),
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(
            Icons.close,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.lock,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset("assets/logos/cover.jpg"),
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text(
                    'Label',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white70,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Comma',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const Text(
                    'The Harley Academy Community for Aesthetic Education',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    height: 100,
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white70,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: users.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  CircleAvatar(
                                    radius: 30,
                                    backgroundImage:
                                        NetworkImage(users[index]['image']!),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    height: 135,
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white70,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'About This Network',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Icon(
                              Icons.person,
                              color: Colors.white70,
                            ),
                            SizedBox(width: 7),
                            Text(
                              '7,986 Members',
                              style: TextStyle(color: Colors.white70),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: Colors.white70,
                            ),
                            SizedBox(width: 7),
                            Text(
                              'Visit Our Website',
                              style: TextStyle(color: Colors.white70),
                            ),
                            Spacer(),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                              size: 18,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    height: 100,
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white70,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Manage',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(
                              Icons.settings,
                              color: Colors.white70,
                            ),
                            SizedBox(width: 6),
                            Text(
                              'Personal Settings',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            Spacer(),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                              size: 18,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Welcome Checklist',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Image.asset(
                        "assets/logos/app_logo.png",
                        width: 30,
                        height: 30,
                      ),
                      const SizedBox(width: 4),
                      const Text(
                        'Comma',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  const Text(
                    'Fill Out Your Profile',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
