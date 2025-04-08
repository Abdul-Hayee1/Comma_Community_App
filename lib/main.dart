// ignore_for_file: avoid_print

import 'package:comma_community_app/firebase_options.dart';
import 'package:comma_community_app/modules/boarding/account_details/view/add_photo_screen.dart';
import 'package:comma_community_app/modules/boarding/account_details/view/pending_approval_screen.dart';
import 'package:comma_community_app/modules/boarding/account_details/view/questions_screen.dart';
import 'package:comma_community_app/modules/boarding/account_details/view/status_screen.dart';
import 'package:comma_community_app/modules/boarding/account_details/view/signIn_loading_screen.dart';
import 'package:comma_community_app/modules/boarding/auth/view/create_account_screen.dart';
import 'package:comma_community_app/modules/boarding/auth/view/forgot_password_screen.dart';
import 'package:comma_community_app/modules/boarding/auth/view/login_screen.dart';
import 'package:comma_community_app/modules/main/appearance/appearance.dart';
import 'package:comma_community_app/modules/main/bookmarks/bookmarks.dart';
import 'package:comma_community_app/modules/main/chat/view/search_chat.dart';
import 'package:comma_community_app/modules/main/events/events_calendar.dart';
import 'package:comma_community_app/modules/main/networkDetails/network_details.dart';
import 'package:comma_community_app/modules/main/view/main_screen.dart';
import 'package:comma_community_app/modules/main/startHere/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  OneSignal.initialize('3a90fe4c-b4a5-400d-819a-7e3edcbcb571');
  OneSignal.Notifications.requestPermission(true);
  OneSignal.User.addTagWithKey('platform', 'mobile');

  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}

class App extends ConsumerWidget {
  const App({super.key});

  Widget _getInitialRoute() {
    return FirebaseAuth.instance.currentUser == null
        ? const LoginScreen()
        : const HomeScreen();
  }

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
            '/': (context) => _getInitialRoute(),
            '/signInLoading': (context) => const SigninLoadingScreen(),
            '/signUp': (context) => const CreateAccountScreen(),
            '/home': (context) => const HomeScreen(),
            '/addPhoto': (context) => const AddPhotoScreen(),
            '/questions': (context) => const QuestionsScreen(),
            '/pendingApproval': (context) => const PendingApprovalScreen(),
            '/status': (context) => const StatusScreen(),
            '/forgotPassword': (context) => ForgotPasswordScreen(),
            '/welcome': (context) => const WelcomeScreen(),
            '/network': (context) => const NetworkPage(),
            '/bookmarks': (context) => const BookmarksScreen(),
            "/appearance": (context) => const AppearanceScreen(),
            "/searchChat": (context) => const SearchChat(),
            "/calendar": (context) => const CalendarScreen(),
          },
        );
      },
    );
  }
}
