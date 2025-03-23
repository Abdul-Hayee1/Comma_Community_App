import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EventsScreen extends StatelessWidget {
  const EventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: // if (no events)
          //{
          Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 40.h, left: 16.w, right: 16.w),
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 30.h),
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(7),
        ),
        child: const Center(
          child: Text(
            'Looks like there are no upcoming events.',
            style: TextStyle(color: Colors.white, fontSize: 16),
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
    );
  }
}
