import 'package:comma_community_app/modules/boarding/account_details/view/add_photo_screen.dart';
import 'package:comma_community_app/modules/boarding/account_details/view/pending_approval_screen.dart';
import 'package:comma_community_app/modules/boarding/account_details/view/questions_screen.dart';
import 'package:comma_community_app/modules/boarding/account_details/view/status_screen.dart';
import 'package:comma_community_app/modules/boarding/account_details/view/signIn_loading_screen.dart';
import 'package:comma_community_app/modules/boarding/auth/view/create_account_screen.dart';
import 'package:comma_community_app/modules/boarding/auth/view/forgot_password_screen.dart';
import 'package:comma_community_app/modules/boarding/auth/view/login_screen.dart';
import 'package:comma_community_app/modules/main/view/main_screen.dart';
import 'package:comma_community_app/modules/main/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          routes: {
            '/': (context) => LoginScreen(),
            '/signInLoading': (context) => const SigninLoadingScreen(),
            '/signUp': (context) => CreateAccountScreen(),
            '/home': (context) => const HomeScreen(),
            '/addPhoto': (context) => const AddPhotoScreen(),
            '/questions': (context) => const QuestionsScreen(),
            '/pendingApproval': (context) => const PendingApprovalScreen(),
            '/status': (context) => const StatusScreen(),
            '/forgotPassword': (context) => ForgotPasswordScreen(),
            '/welcome': (context) => const WelcomeScreen(),
          },
        );
      },
    );
  }
}
