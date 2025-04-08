// ignore_for_file: use_build_context_synchronously, unused_local_variable, no_leading_underscores_for_local_identifiers, avoid_print

import 'package:comma_community_app/modules/boarding/auth/controller/auth_controller.dart';
import 'package:comma_community_app/modules/main/profile/controller/profile_controller.dart';
import 'package:comma_community_app/one_signal/one_signal_service.dart';
import 'package:comma_community_app/providers/auth_provider.dart';
import 'package:comma_community_app/providers/profile_provider.dart';
import 'package:comma_community_app/widgets/my_button.dart';
import 'package:comma_community_app/widgets/my_textfield.dart';
import 'package:comma_community_app/widgets/password_textfield.dart';
import 'package:comma_community_app/widgets/social_logins.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AuthController authController = ref.watch(authenticationNotifierProvider);
    AuthNotifier authNotifier =
        ref.read(authenticationNotifierProvider.notifier);
    ProfileController profileController = ref.watch(profileNotifierProvider);
    ProfileNotifier profileNotifier =
        ref.read(profileNotifierProvider.notifier);
    final _emailController = authController.signInEmailController;
    final _passwordController = authController.signInPasswordController;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: const Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: CircleAvatar(
              radius: 30,
              backgroundColor: Color.fromARGB(255, 5, 35, 60),
              child: Image(
                image: AssetImage(
                  'assets/logos/app_logo.png',
                ),
                width: 70,
                height: 70,
              ),
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 20, 24, 33),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'INVITI',
                style: TextStyle(fontSize: 12, color: Colors.grey[300]),
              ),
              const Text(
                'Sign In',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 20, 24, 33),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 15),
                MyTextfield(
                  controller: _emailController,
                  hintText: 'Email',
                  leftPadding: 18,
                  rightPadding: 18,
                ),
                const SizedBox(height: 8),
                PasswordTextfield(
                  controller: _passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),
                const SizedBox(height: 4),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, "/forgotPassword");
                        },
                        child: Text(
                          'Forgot Password?',
                          style:
                              TextStyle(color: Colors.grey[300], fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 50.h),
                MyButton(
                  hintText: 'Sign In',
                  bgcolor: const Color.fromARGB(255, 70, 78, 185),
                  onPressed: () async {
                    FocusScope.of(context).unfocus();
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: Colors.blue,
                          ),
                        );
                      },
                    );
                    User? user = await authNotifier.signInWithEmailPassword(
                        context,
                        _emailController.text,
                        _passwordController.text);
                    authNotifier.clearSignInFields();

                    if (user != null) {
                      authNotifier.resetDrawerState(ref);
                      Navigator.pushReplacementNamed(context, "/");
                      await OneSignal.User.addTagWithKey("user_id",
                          FirebaseAuth.instance.currentUser?.uid ?? "0");
                      await Future.delayed(const Duration(seconds: 5));
                      sendNotification(
                        "Welcome, ${profileController.userName}! We're happy to have you here. Enjoy your experience! ✨",
                        userId: FirebaseAuth.instance.currentUser?.uid,
                      );

                      print("Signed in with email password");
                    } else {
                      print("Sign in failed");
                    }
                  },
                  isOutlined: false,
                ),
                SizedBox(height: 30.h),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, "/signUp");
                  },
                  child: const Text(
                    'Not a Member? Create Account',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
                SizedBox(height: 22.h),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 25.h),
                const Row(
                  children: [
                    SizedBox(width: 18),
                    Text(
                      'Or Use',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                const SocialLogins(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
