import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 20, left: 14, right: 14),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.4),
          borderRadius: BorderRadius.circular(7),
        ),
        child: //if(no notifications)
            const Column(
          children: [
            SizedBox(height: 10),
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
