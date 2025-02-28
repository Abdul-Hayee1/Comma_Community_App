import 'package:comma_community_app/widgets/my_button.dart';
import 'package:flutter/material.dart';

class PendingApprovalScreen extends StatelessWidget {
  const PendingApprovalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF141821),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 30, left: 16, right: 16),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.blue,
                    radius: 24,
                    child: Icon(
                      Icons.copyright,
                      color: Colors.white,
                      size: 40,
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
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "Pending Approval",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: Text(
                'Your Request to join has been sent!',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: Text(
                'We will review your request to join soon. You will receive an email from Inviti if you\'ve been approved, and you can check your approval here at any time.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
            const Spacer(),
            const SizedBox(height: 240),
            MyButton(
              hintText: 'See Status',
              onPressed: () {
                Navigator.pushNamed(context, "/status");
              },
              bgcolor: const Color.fromARGB(255, 70, 78, 185),
              isOutlined: false,
            ),
            const SizedBox(height: 10),
            MyButton(
              hintText: 'Sign Out',
              onPressed: () {},
              bgcolor: const Color.fromARGB(255, 20, 24, 33),
              isOutlined: true,
            ),
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
