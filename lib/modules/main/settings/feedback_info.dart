import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FeedbackandInfoModal extends StatelessWidget {
  const FeedbackandInfoModal({super.key});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.93,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 8.0.h, left: 16.0.w, right: 16.0.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
                const Text(
                  'Feedback and Info',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 18.w),
              ],
            ),
          ),
          SizedBox(height: 20.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.h),
            child: const Text(
              'Feedback',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 30.h),
          Divider(
            thickness: 0.5,
            color: Colors.grey[700],
          ),
          buildListTile('Help Center', () {}),
          Divider(thickness: 0.5, color: Colors.grey[700]),
          SizedBox(height: 30.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.h),
            child: const Text(
              'Info',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          Divider(
            thickness: 0.5,
            color: Colors.grey[700],
          ),
          buildListTile('Comma User Agreement Terms', () {}),
          Divider(
            thickness: 0.5,
            color: Colors.grey[700],
          ),
          buildListTile('Mighty Terms of Use', () {}),
          Divider(
            thickness: 0.5,
            color: Colors.grey[700],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.h),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Version',
                  style: TextStyle(color: Colors.white),
                ),
                Text('1.0.0', style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget buildListTile(String text, VoidCallback onPressed) {
  return GestureDetector(
    onTap: onPressed,
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 6.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: const TextStyle(color: Colors.white),
          ),
          const Icon(
            Icons.arrow_forward_ios,
            color: Colors.white,
            size: 16,
          ),
        ],
      ),
    ),
  );
}
