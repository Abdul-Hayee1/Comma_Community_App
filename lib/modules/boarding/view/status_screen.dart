import 'package:comma_community_app/widgets/my_button.dart';
import 'package:flutter/material.dart';

class StatusScreen extends StatelessWidget {
  const StatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF141821),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 50, left: 16, right: 16),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Color.fromARGB(255, 5, 35, 60),
                    child: Image(
                      image: AssetImage(
                        'assets/logos/app_logo.png',
                      ),
                      width: 70,
                      height: 70,
                    ),
                  ),
                  SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "INVITI",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        "Welcome, Abdul !",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 4,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Text(
                        'Edit Account',
                        style: TextStyle(fontSize: 14, color: Colors.grey[400]),
                      ),
                    ],
                  ),
                  const SizedBox(height: 7),
                  Row(
                    children: [
                      Container(
                        width: 4,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Text(
                        'Edit Answers',
                        style: TextStyle(fontSize: 14, color: Colors.grey[400]),
                      ),
                    ],
                  ),
                  const SizedBox(height: 7),
                  Row(
                    children: [
                      Container(
                        width: 4,
                        height: 30,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Colors.blue, Colors.white],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Text(
                        'Approval Pending',
                        style: TextStyle(fontSize: 14, color: Colors.grey[400]),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),
            MyButton(
                hintText: 'Sign Out',
                onPressed: () {
                  Navigator.pushNamed(context, "/");
                },
                bgcolor: Colors.black,
                isOutlined: true),
            const SizedBox(height: 18),
            Center(
              child: RichText(
                text: const TextSpan(
                  text: 'Signed in as: ',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                  children: [
                    TextSpan(
                      text: 'john@gmail.com',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 7),
            const Divider(
              color: Colors.grey,
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
