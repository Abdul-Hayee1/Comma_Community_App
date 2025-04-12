import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:comma_community_app/widgets/bottom_modal_sheets.dart';

class Post {
  final String author;
  final String role;
  final String content;
  final String postedTime;
  final int commentCount;
  final int likeCount;
  final String? profileImage;

  Post({
    required this.author,
    required this.role,
    required this.content,
    required this.postedTime,
    required this.commentCount,
    required this.likeCount,
    this.profileImage,
  });

  factory Post.fromFirestore(Map<String, dynamic> data) {
    return Post(
      author: data['author'],
      role: data['role'],
      content: data['content'],
      postedTime: data['postedTime'],
      commentCount: data['commentCount'],
      likeCount: data['likeCount'],
      profileImage: data['profileImage'],
    );
  }
}

class PostWidget extends StatefulWidget {
  final Post post;

  const PostWidget({super.key, required this.post});

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
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
                    backgroundImage: widget.post.profileImage != null
                        ? NetworkImage(widget.post.profileImage!)
                        : null,
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.post.author,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      Text(widget.post.role,
                          style: const TextStyle(color: Colors.grey)),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(widget.post.content,
                  style: const TextStyle(color: Colors.white)),
              const SizedBox(height: 10),
              Text(
                "Posted ${widget.post.postedTime}",
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
                        onPressed: () {
                          showCommentSectionModal(context, widget.post);
                        },
                      ),
                      Text(
                        widget.post.commentCount.toString(),
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
                        widget.post.likeCount.toString(),
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
