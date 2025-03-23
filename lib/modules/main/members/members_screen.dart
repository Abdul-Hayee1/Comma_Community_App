import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600, // Set a fixed height
      width: double.infinity,
      child: Stack(
        children: users.asMap().entries.map((entry) {
          final int index = entry.key;
          final user = entry.value;

          // Generate random positions
          double left = Random().nextDouble() * 300;
          double top = Random().nextDouble() * 500;
          double size = 70 + Random().nextDouble() * 50;

          return Positioned(
            left: left,
            top: top,
            child: GestureDetector(
              child: CircleAvatar(
                radius: size / 2,
                backgroundImage: NetworkImage(user['image']!),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
