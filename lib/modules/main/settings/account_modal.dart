// ignore_for_file: unused_local_variable

import 'package:comma_community_app/modules/main/profile/controller/profile_controller.dart';
import 'package:comma_community_app/providers/profile_provider.dart';
import 'package:comma_community_app/widgets/bottom_modal_sheets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountSettingsModal extends ConsumerWidget {
  const AccountSettingsModal({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ProfileController profileController = ref.watch(profileNotifierProvider);
    ProfileNotifier profileNotifier =
        ref.read(profileNotifierProvider.notifier);
    return FractionallySizedBox(
      heightFactor: 0.93,
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0, left: 16.0, right: 16.0),
        child: Column(
          children: [
            Row(
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
                  'Account',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 10),
              ],
            ),
            SizedBox(height: 40.h),
            Container(
              width: double.infinity,
              height: 45,
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: const Text(
                'Change Email',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            Divider(thickness: 0.5, color: Colors.grey[700]),
            Container(
              width: double.infinity,
              height: 45,
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: const Text(
                'Manage Zoom',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            Divider(thickness: 0.5, color: Colors.grey[700]),
            const Spacer(),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 10.h),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(4),
                border: Border.all(width: 1.5, color: Colors.white70),
              ),
              child: GestureDetector(
                onTap: () {
                  showDeactivateAccountModal(context);
                },
                child: const Text('Deactivate Account',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center),
              ),
            ),
            SizedBox(height: 18.h),
            TextButton(
              onPressed: () {
                profileNotifier.deleteUserAccount(context);
              },
              child: const Text(
                'Permanently Delete Account',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 18.h),
          ],
        ),
      ),
    );
  }
}
