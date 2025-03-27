import 'package:comma_community_app/modules/main/startHere/welcome_screen.dart';
import 'package:comma_community_app/modules/main/view/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StartHereScreen extends ConsumerWidget {
  const StartHereScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 4.h),
            InkWell(
              onTap: () {
                ref.read(drawerIndexProvider.notifier).state = 9;
                ref.read(drawerItemSelectedProvider.notifier).state = true;
                ref.read(selectedIndexProvider.notifier).state = 0;
                ref.read(firstScreenProvider.notifier).state =
                    const WelcomeScreen();
              },
              child: Container(
                height: 90.h,
                decoration: BoxDecoration(
                  color: Colors.blueGrey[900],
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 8.0.h),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        radius: 32,
                        backgroundColor: Colors.white,
                        child: Image(
                          image: AssetImage(
                            'assets/logos/app_logo.png',
                          ),
                          width: 90,
                          height: 90,
                        ),
                      ),
                      SizedBox(width: 16.w),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Welcome!',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.sp),
                          ),
                          Text(
                            'LAST ACTIVE 5H AGO',
                            style:
                                TextStyle(color: Colors.grey, fontSize: 12.sp),
                          ),
                        ],
                      ),
                      Spacer(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Joined',
                            style: TextStyle(color: Colors.grey[500]),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
