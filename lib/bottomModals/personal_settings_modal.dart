import 'package:comma_community_app/bottomModals/account_modal.dart';
import 'package:flutter/material.dart';

void showPersonalSettingsModal(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: const Color.fromARGB(255, 36, 38, 63),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(20),
      ),
    ),
    builder: (context) {
      return _PersonalSettingsModal();
    },
  );
}

class _PersonalSettingsModal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.93,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 16.0, right: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(Icons.close, color: Colors.white),
                ),
                const Text(
                  'Personal Settings',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 10),
              ],
            ),
          ),
          Divider(thickness: 0.5, color: Colors.grey[700]),
          _SettingsOption(
            hintText: 'Account',
            ontap: () {
              showAccountModalSheet(context);
            },
          ),
          Divider(thickness: 0.5, color: Colors.grey[700]),
          _SettingsOption(
            hintText: 'Edit Profile',
            ontap: () {},
          ),
          Divider(thickness: 0.5, color: Colors.grey[700]),
          _SettingsOption(
            hintText: 'Notifications',
            ontap: () {},
          ),
          Divider(thickness: 0.5, color: Colors.grey[700]),
          _SettingsOption(
            hintText: 'Appearance',
            ontap: () {},
          ),
          Divider(thickness: 0.5, color: Colors.grey[700]),
          _SettingsOption(
            hintText: 'Feedback and Info',
            ontap: () {},
          ),
          Divider(thickness: 0.5, color: Colors.grey[700]),
        ],
      ),
    );
  }
}

class _SettingsOption extends StatelessWidget {
  const _SettingsOption({required this.hintText, this.ontap});

  final String hintText;
  final VoidCallback? ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              hintText,
              style: const TextStyle(color: Colors.white),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
              size: 18,
            ),
          ],
        ),
      ),
    );
  }
}
