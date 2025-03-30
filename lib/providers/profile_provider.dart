// ignore_for_file: avoid_print, use_build_context_synchronously

import 'dart:io';

import 'package:comma_community_app/modules/main/profile/controller/profile_controller.dart';
import 'package:comma_community_app/widgets/show_exception_dialog.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class ProfileNotifier extends StateNotifier<ProfileController> {
  ProfileNotifier() : super(ProfileController());

  Future<void> getUserInfo() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      state.userName = user.displayName ?? "...";
      List<String> nameParts = state.userName.split(' ');

      state.firstName = nameParts.isNotEmpty ? nameParts[0] : "";
      state.lastName = nameParts.length > 1 ? nameParts[1] : "";

      state.editProfileFirstNameController.text = state.firstName;
      state.editProfileLastNameController.text = state.lastName;

      state.userEmail = user.email ?? "...";
      state.photoUrl =
          user.photoURL ?? "https://randomuser.me/api/portraits/men/1.jpg";
      print('User Name: ${user.displayName}');
      print('User Email: ${user.email}');
      print('User Photo URL: ${user.photoURL}');

      updateState();
    } else {
      print("No user is signed in.");
    }
  }

  Future<void> pickAndUpdateImage(bool isCamera) async {
    PermissionStatus status;
    if (isCamera) {
      status = await Permission.camera.request();
    } else {
      if (Platform.isAndroid && await isAndroid13OrAbove()) {
        status = await Permission.photos.request();
      } else {
        status = await Permission.storage.request();
      }
    }

    if (status.isGranted) {
      final image = await ImagePicker().pickImage(
        source: isCamera ? ImageSource.camera : ImageSource.gallery,
        imageQuality: 85,
      );
      if (image != null) {
        state.userSelectedImage = image;
        updateState();
      }
    }
  }

  Future<bool> isAndroid13OrAbove() async {
    AndroidDeviceInfo androidInfo = await DeviceInfoPlugin().androidInfo;
    return androidInfo.version.sdkInt >= 33;
  }

  Future<void> deleteUserAccount(BuildContext context) async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;

    if (user == null) {
      await showExceptionAlertDialog(
        title: 'Error',
        exception: 'No user is currently logged in.',
        context: context,
      );
      return;
    }

    try {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(
          child: CircularProgressIndicator(color: Colors.blue),
        ),
      );

      try {
        await user.delete();
      } catch (e) {
        Navigator.pop(context);
        await showExceptionAlertDialog(
          title: 'Error',
          exception:
              'Failed to delete account. Please try again. Error: ${e.toString()}',
          context: context,
        );
        print('Error deleting user account: $e');
        return;
      }

      if (user.providerData.isNotEmpty &&
          user.providerData.first.providerId == 'google.com') {
        try {
          final GoogleSignIn googleSignIn = GoogleSignIn();
          await googleSignIn.signOut();
        } catch (e) {
          Navigator.pop(context);
          await showExceptionAlertDialog(
            title: 'Error',
            exception: 'Failed to sign out from Google. Error: ${e.toString()}',
            context: context,
          );
          print('Error signing out from Google: $e');
          return;
        }
      }

      if (user.providerData.isNotEmpty &&
          user.providerData.first.providerId == 'facebook.com') {
        try {
          await FacebookAuth.instance.logOut();
        } catch (e) {
          Navigator.pop(context);
          await showExceptionAlertDialog(
            title: 'Error',
            exception:
                'Failed to sign out from Facebook. Error: ${e.toString()}',
            context: context,
          );
          print('Error signing out from Facebook: $e');
          return;
        }
      }

      try {
        await auth.signOut();
      } catch (e) {
        Navigator.pop(context);
        await showExceptionAlertDialog(
          title: 'Error',
          exception: 'Failed to sign out. Error: ${e.toString()}',
          context: context,
        );
        print('Error signing out from Firebase: $e');
        return;
      }

      Navigator.pushReplacementNamed(context, "/");
    } catch (e) {
      Navigator.pop(context);
      await showExceptionAlertDialog(
        title: 'Unexpected Error',
        exception:
            'An unexpected error occurred. Please try again. Error: ${e.toString()}',
        context: context,
      );
      print('Unexpected error deleting account: $e');
    }
  }

  void updateState() {
    state = state.copy();
  }
}

final profileNotifierProvider =
    StateNotifierProvider<ProfileNotifier, ProfileController>(
  (ref) {
    return ProfileNotifier();
  },
);
