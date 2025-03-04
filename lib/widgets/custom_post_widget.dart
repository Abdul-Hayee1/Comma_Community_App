import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class Post {
  final String author;
  final String role;
  final String content;
  final String postedTime;
  final int comments;
  final int likes;
  final String? profileImage;

  Post({
    required this.author,
    required this.role,
    required this.content,
    required this.postedTime,
    required this.comments,
    required this.likes,
    this.profileImage,
  });
}

class PostWidget extends StatelessWidget {
  final Post post;

  const PostWidget({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        color: const Color.fromARGB(255, 10, 39, 63),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey,
                    radius: 20,
                    backgroundImage: post.profileImage != null
                        ? NetworkImage(post.profileImage!)
                        : null,
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(post.author,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      Text(post.role,
                          style: const TextStyle(color: Colors.grey)),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(post.content, style: const TextStyle(color: Colors.white)),
              const SizedBox(height: 10),
              Text(
                "Posted ${post.postedTime}",
                style: const TextStyle(color: Colors.grey, fontSize: 12),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {},
                      child: const Icon(Icons.more_vert, color: Colors.white)),
                  const Spacer(),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(LucideIcons.messageCircle,
                            color: Colors.white),
                        onPressed: () {},
                      ),
                      Text(
                        post.comments.toString(),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon:
                            const Icon(LucideIcons.heart, color: Colors.white),
                        onPressed: () {},
                      ),
                      Text(
                        post.likes.toString(),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
