import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: //if(no notifications)
            Column(
          children: [
            SizedBox(height: 50),
            Center(
              child: Column(
                children: [
                  Icon(Icons.notifications, size: 50, color: Colors.grey),
                  SizedBox(height: 15),
                  Text(
                    'You don\'t have any notifications.',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
        //if(there are notifications)

        //Column(
        //children: [],
        //),
      ),
    );
  }
}
