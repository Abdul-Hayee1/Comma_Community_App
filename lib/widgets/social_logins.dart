// ignore_for_file: unused_local_variable, avoid_print, use_build_context_synchronously

import 'package:comma_community_app/modules/boarding/auth/controller/auth_controller.dart';
import 'package:comma_community_app/modules/main/profile/controller/profile_controller.dart';
import 'package:comma_community_app/one_signal/one_signal_service.dart';
import 'package:comma_community_app/providers/auth_provider.dart';
import 'package:comma_community_app/providers/profile_provider.dart';
import 'package:comma_community_app/widgets/socials_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

class SocialLogins extends ConsumerWidget {
  const SocialLogins({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AuthController authController = ref.watch(authenticationNotifierProvider);
    AuthNotifier authNotifier =
        ref.read(authenticationNotifierProvider.notifier);
    ProfileController profileController = ref.watch(profileNotifierProvider);
    ProfileNotifier profileNotifier =
        ref.read(profileNotifierProvider.notifier);

    return Column(
      children: [
        SocialsButton(
          hintText: 'Sign In with Google',
          imagePath: 'assets/logos/google_logo.png',
          onTap: () async {
            User? user = await authNotifier.signInWithGoogle();

            if (user != null) {
              authNotifier.resetDrawerState(ref);
              Navigator.pushReplacementNamed(context, "/");
              await OneSignal.User.addTagWithKey(
                  "user_id", FirebaseAuth.instance.currentUser?.uid ?? "0");
              await Future.delayed(const Duration(seconds: 5));
              sendNotification(
                "Welcome, ${profileController.userName}! We're happy to have you here. Enjoy your experience! ✨",
                userId: FirebaseAuth.instance.currentUser?.uid,
              );
              print("Signed in with google");
            } else {
              print("Sign in failed");
            }
          },
        ),
        SizedBox(height: 12.h),
        SocialsButton(
            hintText: 'Sign In with Facebook',
            imagePath: 'assets/logos/facebook_logo.png',
            onTap: () async {
              User? user = await authNotifier.signInWithFacebook();
              if (user != null) {
                authNotifier.resetDrawerState(ref);
                Navigator.pushReplacementNamed(context, "/");
                await OneSignal.User.addTagWithKey(
                    "user_id", FirebaseAuth.instance.currentUser?.uid ?? "0");
                await Future.delayed(const Duration(seconds: 5));
                sendNotification(
                  "Welcome, ${profileController.userName}! We're happy to have you here. Enjoy your experience! ✨",
                  userId: FirebaseAuth.instance.currentUser?.uid,
                );
                print("Signed in with facebook");
              } else {
                print("Sign in failed");
              }
            }),
        SizedBox(height: 12.h),
        const SocialsButton(
          hintText: 'Sign In with LinkedIn',
          imagePath: 'assets/logos/linkedin_logo.png',
        ),
        SizedBox(height: 12.h),
        const SocialsButton(
          hintText: 'Sign In with Apple',
          imagePath: 'assets/logos/apple_logo.png',
        ),
      ],
    );
  }
}
