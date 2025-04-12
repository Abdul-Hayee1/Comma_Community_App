// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            color: Colors.black.withOpacity(0.7),
          ),
        ),
        Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child: Container(
              width: 160.w,
              padding: EdgeInsets.symmetric(vertical: 24.w, horizontal: 18.w),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.8),
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(color: Colors.white.withOpacity(0.2)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    blurRadius: 12,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SpinKitCircle(
                    color: Colors.white,
                    size: 50.w,
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    "Loading...",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: 15.sp,
                          color: Colors.white.withOpacity(0.9),
                        ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
