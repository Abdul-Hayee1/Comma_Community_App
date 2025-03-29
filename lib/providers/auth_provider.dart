// ignore_for_file: avoid_print, use_build_context_synchronously, no_leading_underscores_for_local_identifiers

import 'package:comma_community_app/modules/boarding/auth/controller/auth_controller.dart';
import 'package:comma_community_app/modules/main/feed/view/feed_screen.dart';
import 'package:comma_community_app/modules/main/view/main_screen.dart';
import 'package:comma_community_app/widgets/show_exception_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthNotifier extends StateNotifier<AuthController> {
  AuthNotifier() : super(AuthController());

  Future<User?> signInWithEmailPassword(
      BuildContext context, String email, String password) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      String errorTitle;
      String errorMessage;

      switch (e.code) {
        case 'user-not-found':
          errorTitle = "Account Not Found";
          errorMessage =
              "No account exists with this email address. Please check your email or create a new account.";
          break;
        case 'wrong-password':
          errorTitle = "Incorrect Password";
          errorMessage =
              "The password you entered is incorrect. Please try again or reset your password if you've forgotten it.";
          break;
        case 'invalid-email':
          errorTitle = "Invalid Email";
          errorMessage =
              "The email address you entered is not valid. Please enter a valid email address (e.g., yourname@example.com).";
          break;
        case 'user-disabled':
          errorTitle = "Account Disabled";
          errorMessage =
              "This account has been disabled. Please contact support for assistance.";
          break;
        case 'too-many-requests':
          errorTitle = "Too Many Attempts";
          errorMessage =
              "We've detected too many login attempts. Please wait a while before trying again.";
          break;
        case 'network-request-failed':
          errorTitle = "Network Error";
          errorMessage =
              "Unable to connect to the server. Please check your internet connection and try again.";
          break;
        case 'operation-not-allowed':
          errorTitle = "Login Disabled";
          errorMessage =
              "Email/password login is currently disabled. Please contact support.";
          break;
        default:
          errorTitle = "Login Failed";
          errorMessage =
              "An unexpected error occurred. Please try again later. (Error: ${e.code})";
      }

      showExceptionAlertDialog(
        title: errorTitle,
        exception: errorMessage,
        context: context,
      );
    } catch (e) {
      Navigator.of(context).pop();
      showExceptionAlertDialog(
        title: "Login Failed",
        exception: "An unexpected error occurred. Please try again later.",
        context: context,
      );
    }
    return null;
  }

  Future<User?> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser != null) {
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      return userCredential.user;
    }
    return null;
  }

  Future<User?> signInWithFacebook() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login(
        permissions: ['email', 'public_profile'],
      );

      if (result.status == LoginStatus.success) {
        final AccessToken accessToken = result.accessToken!;

        final userData = await FacebookAuth.instance.getUserData(
          fields: 'email,name,picture',
        );

        AuthCredential credential =
            FacebookAuthProvider.credential(accessToken.tokenString);

        final UserCredential userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);

        final User? firebaseUser = userCredential.user;
        print('=== User Information ===');
        print('Firebase UID: ${firebaseUser?.uid}');
        print('Name: ${userData['name']}');
        print('Email: ${userData['email']}');
        print('Photo URL: ${userData['picture']?['data']?['url']}');
        print('Provider: ${userCredential.credential?.providerId}');
        print('Firebase email: ${firebaseUser?.email}');
        print('Firebase display name: ${firebaseUser?.displayName}');
        print('Firebase photo URL: ${firebaseUser?.photoURL}');

        return userCredential.user;
      } else {
        print("Facebook Auth Error: ${result.message}");
      }
    } catch (e) {
      print("Exception during Facebook sign-in: $e");
    }
    return null;
  }

  Future<void> signOut() async {
    try {
      final user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        await FirebaseAuth.instance.signOut();

        final isGoogleSignIn = user.providerData
            .any((provider) => provider.providerId == 'google.com');
        if (isGoogleSignIn) {
          final googleSignIn = GoogleSignIn();
          await googleSignIn.signOut();
        }

        final isFacebookSignIn = user.providerData
            .any((provider) => provider.providerId == 'facebook.com');
        if (isFacebookSignIn) {
          await FacebookAuth.instance.logOut();
        }
      }
    } catch (e) {
      print("Error during sign out: $e");
    }
  }

  void clearSignInFields() {
    state.signInEmailController.clear();
    state.signInPasswordController.clear();
    updateState();
  }

  void resetDrawerState(WidgetRef ref) {
    ref.read(drawerIndexProvider.notifier).state = 0;
    ref.read(drawerItemSelectedProvider.notifier).state = true;
    ref.read(selectedIndexProvider.notifier).state = 0;
    ref.read(firstScreenProvider.notifier).state = const FeedScreen();
  }

  void updateState() {
    state = state.copy();
  }
}

final authenticationNotifierProvider =
    StateNotifierProvider<AuthNotifier, AuthController>(
  (ref) {
    return AuthNotifier();
  },
);
