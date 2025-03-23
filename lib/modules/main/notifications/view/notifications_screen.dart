import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: // if (no notifcations)
            //{
            Container(
          width: double.infinity,
          margin: EdgeInsets.only(top: 20.h, left: 16.w, right: 16.w),
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.circular(7),
          ),
          child: const Center(
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
        ),
        //}
        //else
        //
        //{
        //Column(
        // children: [

        // ],
        // ),
        //}
      ),
    );
  }
}
