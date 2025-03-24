import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:comma_community_app/widgets/bottom_modal_sheets.dart';

class MembersScreen extends ConsumerStatefulWidget {
  const MembersScreen({super.key});

  @override
  ConsumerState<MembersScreen> createState() => _MembersScreenState();
}

class _MembersScreenState extends ConsumerState<MembersScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            BubbleUI(),
          ],
        ),
      ),
    );
  }
}

class BubbleUI extends StatelessWidget {
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

  final List<Map<String, dynamic>> categories = [
    {
      'title': 'Members Near You',
      'count': 25,
      'icon': LucideIcons.star,
      'users': [],
    },
    {
      'title': 'Dentist',
      'count': 238,
      'icon': LucideIcons.star,
      'users': [],
    },
    {
      'title': 'Aesthetic Doctor',
      'count': 6,
      'icon': LucideIcons.star,
      'users': [],
    },
    {
      'title': 'Top Members',
      'count': 25,
      'icon': LucideIcons.star,
      'users': [],
    },
    {
      'title': 'Doctor',
      'count': 779,
      'icon': LucideIcons.star,
      'users': [],
    },
    {
      'title': 'Pharmacist',
      'count': 37,
      'icon': LucideIcons.star,
      'users': [],
    },
    {
      'title': 'Nurse',
      'count': 931,
      'icon': LucideIcons.star,
      'users': [],
    },
  ];

  BubbleUI({super.key}) {
    final random = Random();
    for (var category in categories) {
      final shuffledUsers = List<Map<String, String>>.from(users)
        ..shuffle(random);
      final count = min(12, shuffledUsers.length);
      category['users'] = shuffledUsers.sublist(0, count);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                showMembersFilterModelSheet(context);
              },
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  margin: const EdgeInsets.only(left: 12),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 44, 51, 61),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Explore",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      Icon(
                        Icons.arrow_drop_down,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ...categories.map((category) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 16, top: 12),
                    decoration: BoxDecoration(
                      color: Colors.white70.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    height: 30,
                    width: 200,
                    child: Row(
                      children: [
                        const SizedBox(width: 6),
                        Icon(
                          category['icon'],
                          color: Colors.blue,
                          size: 18,
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            "${category['title']} | ${category['count']}",
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 300,
                    width: double.infinity,
                    child: _buildCategoryBubbleLayout(
                      context,
                      category['users'],
                      category['title'],
                    ),
                  ),
                ],
              );
            }),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryBubbleLayout(
    BuildContext context,
    List<Map<String, String>> categoryUsers,
    String seed,
  ) {
    final screenWidth = MediaQuery.of(context).size.width;
    const bubbleAreaHeight = 300.0;
    const columns = 5;
    final columnWidth = screenWidth / columns;

    return Stack(
      children: categoryUsers.asMap().entries.map((entry) {
        final index = entry.key;
        final user = entry.value;

        final random =
            Random("$seed${user['firstName']}${user['lastName']}".hashCode);
        final column = index % columns;

        double left =
            column * columnWidth + random.nextDouble() * (columnWidth - 80);
        double top = random.nextDouble() * (bubbleAreaHeight - 100);
        double size = 50 + random.nextDouble() * 60;

        return Positioned(
          left: left,
          top: top,
          child: GestureDetector(
            onTap: () {
              _showUserProfile(context, user);
            },
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    spreadRadius: 1,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: CircleAvatar(
                radius: size / 2,
                backgroundColor: Colors.grey[200],
                backgroundImage: NetworkImage(user['image']!),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  void _showUserProfile(BuildContext context, Map<String, String> user) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          height: 200,
          width: double.infinity,
          color: const Color.fromARGB(255, 20, 24, 33),
          child: Column(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(user['image']!),
              ),
              const SizedBox(height: 16),
              Text(
                '${user['firstName']} ${user['lastName']}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
