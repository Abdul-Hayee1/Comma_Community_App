import 'package:comma_community_app/widgets/custom_post_widget.dart';
import 'package:flutter/material.dart';

List<Post> posts = [
  Post(
    author: "Dr. John Carter",
    role: "Cardiologist",
    content: "Heart health is the key to a longer life! ❤️",
    postedTime: "2h ago",
    comments: 18,
    likes: 67,
    profileImage: "https://randomuser.me/api/portraits/men/32.jpg",
  ),
  Post(
    author: "Dr. Sarah Thompson",
    role: "Pediatrician",
    content: "Children's health should always be a priority. 👶",
    postedTime: "5h ago",
    comments: 10,
    likes: 54,
    profileImage: "https://randomuser.me/api/portraits/women/45.jpg",
  ),
  Post(
    author: "Dr. Alex Roberts",
    role: "Neurosurgeon",
    content: "The brain is the most fascinating organ! 🧠",
    postedTime: "1d ago",
    comments: 25,
    likes: 98,
    profileImage: "https://randomuser.me/api/portraits/men/58.jpg",
  ),
  Post(
    author: "Nurse Emily White",
    role: "Registered Nurse",
    content: "Nurses are the backbone of healthcare. 🏥",
    postedTime: "3d ago",
    comments: 22,
    likes: 80,
    profileImage: "https://randomuser.me/api/portraits/women/33.jpg",
  ),
  Post(
    author: "Dr. Daniel Lee",
    role: "Orthopedic Surgeon",
    content: "Strong bones, strong body! 🦴",
    postedTime: "4d ago",
    comments: 12,
    likes: 72,
    profileImage: "https://randomuser.me/api/portraits/men/40.jpg",
  ),
  Post(
    author: "Dr. Olivia Adams",
    role: "Dermatologist",
    content: "Healthy skin, happy life! 🌿",
    postedTime: "1w ago",
    comments: 15,
    likes: 85,
    profileImage: "https://randomuser.me/api/portraits/women/60.jpg",
  ),
  Post(
    author: "Dr. William Brown",
    role: "General Physician",
    content: "Preventive care is the best medicine! 💊",
    postedTime: "2w ago",
    comments: 30,
    likes: 120,
    profileImage: "https://randomuser.me/api/portraits/men/50.jpg",
  ),
  Post(
    author: "Dr. Sophia Green",
    role: "Psychiatrist",
    content: "Mental health matters just as much as physical health. 💙",
    postedTime: "3w ago",
    comments: 18,
    likes: 90,
    profileImage: "https://randomuser.me/api/portraits/women/20.jpg",
  ),
  Post(
    author: "Dr. Michael Johnson",
    role: "Endocrinologist",
    content: "Balancing hormones is key to overall well-being. 🧬",
    postedTime: "1mo ago",
    comments: 12,
    likes: 65,
    profileImage: "https://randomuser.me/api/portraits/men/35.jpg",
  ),
];

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Post> latestPosts = posts.take(4).toList();

    return SingleChildScrollView(
      child: Column(
        children: [
          ...latestPosts.map((post) => PostWidget(post: post)).toList()
        ],
      ),
    );
  }
}
