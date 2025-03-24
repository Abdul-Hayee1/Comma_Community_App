import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageTab extends StatelessWidget {
  const PageTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ColoredBox(
        color: const Color.fromARGB(255, 10, 39, 63),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 8.0.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Welcome to Inviti: The\nHarley Academy Community\nfor Aesthetic Education.',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 22),
                ),
                SizedBox(height: 10.h),
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                    ),
                    children: const [
                      TextSpan(text: 'Established in 2025, '),
                      TextSpan(
                        text: 'Inviti',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                          text:
                              ' has\nbecome a fantastic hub of knowledge\nand purpose that connects aesthetic\nmedicine professionals from around\nthe world.'),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                const Divider(
                  thickness: 1,
                  color: Colors.white,
                  indent: 110,
                  endIndent: 110,
                ),
                SizedBox(height: 16.h),
                const Text(
                  'Inviti Guidelines',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
                Text(
                  'you can read the Inviti guidelines',
                  style: TextStyle(color: Colors.white, fontSize: 18.sp),
                ),
                Text(
                  'here.',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.white),
                ),
                SizedBox(height: 16.h),
                const Divider(
                  thickness: 1,
                  color: Colors.white,
                  indent: 110,
                  endIndent: 110,
                ),
                SizedBox(height: 16.h),
                const Text(
                  'Having trouble accessing\nyour plan?',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
                SizedBox(height: 10.h),
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                    ),
                    children: const [
                      TextSpan(text: 'To access the '),
                      TextSpan(
                        text: 'Inviti',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: ' Plan, '),
                      TextSpan(
                          text: 'leave a\ncomment here',
                          style:
                              TextStyle(decoration: TextDecoration.underline)),
                    ],
                  ),
                ),
                SizedBox(height: 40.h),
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                    ),
                    children: const [
                      TextSpan(text: 'If you\'re part of the '),
                      TextSpan(
                        text: 'Harley Academy,',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      TextSpan(text: '\nemail us here:\n'),
                      TextSpan(
                          text: 'comma@harleyacademy.com',
                          style:
                              TextStyle(decoration: TextDecoration.underline)),
                    ],
                  ),
                ),
                SizedBox(height: 80.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
