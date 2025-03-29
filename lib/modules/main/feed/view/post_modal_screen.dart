import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PostModalScreen extends StatefulWidget {
  //final Post post;

  const PostModalScreen({super.key});

  @override
  State<PostModalScreen> createState() => _PostModalScreenState();
}

class _PostModalScreenState extends State<PostModalScreen> {
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.93,
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.0.h),
                child: Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.close, color: Colors.white),
                        Icon(Icons.more_vert, color: Colors.white)
                      ],
                    ),
                    Row(
                      children: [
                        // CircleAvatar(
                        //   backgroundColor: Colors.grey,
                        //   radius: 20,
                        //   backgroundImage: widget.post.profileImage != null
                        //       ? NetworkImage(widget.post.profileImage!)
                        //       : null,
                        // ),
                        // const SizedBox(width: 10),
                        // Column(
                        //   crossAxisAlignment: CrossAxisAlignment.start,
                        //   children: [
                        //     Text(widget.post.author,
                        //         style: const TextStyle(
                        //             fontWeight: FontWeight.bold,
                        //             color: Colors.white)),
                        //     Text(widget.post.role,
                        //         style: const TextStyle(color: Colors.grey)),
                        //   ],
                        // ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: 0.055.sh,
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
            decoration: const BoxDecoration(
              color: Colors.transparent,
              border: Border(top: BorderSide(color: Colors.grey, width: 0.5)),
            ),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.add, color: Colors.white, size: 30),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  onPressed: () {},
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[800],
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: TextField(
                      textAlign: TextAlign.start,
                      decoration: InputDecoration(
                        hintText: "Write a comment...",
                        hintStyle:
                            TextStyle(color: Colors.grey[400], fontSize: 16.sp),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 9.h,
                          horizontal: 8,
                        ),
                      ),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
