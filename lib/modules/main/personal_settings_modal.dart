import 'package:comma_community_app/modules/boarding/auth/view/login_screen.dart';
import 'package:comma_community_app/widgets/bottom_modal_sheets.dart';
import 'package:flutter/material.dart';

class PersonalSettingsModal extends StatelessWidget {
  const PersonalSettingsModal({super.key});

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
            ontap: () {
              showEditProfileModalSheet(context);
            },
          ),
          Divider(thickness: 0.5, color: Colors.grey[700]),
          _SettingsOption(
            hintText: 'Notifications',
            ontap: () {},
          ),
          Divider(thickness: 0.5, color: Colors.grey[700]),
          _SettingsOption(
            hintText: 'Appearance',
            ontap: () {
              Navigator.pushNamed(context, "/appearance");
            },
          ),
          Divider(thickness: 0.5, color: Colors.grey[700]),
          _SettingsOption(
            hintText: 'Feedback and Info',
            ontap: () {
              showFeedbackandInfoModal(context);
            },
          ),
          Divider(thickness: 0.5, color: Colors.grey[700]),
          const Spacer(),
          const CircleAvatar(
            radius: 40,
            backgroundColor: Color.fromARGB(255, 12, 57, 94),
            child: Image(
              image: AssetImage(
                'assets/logos/app_logo.png',
              ),
              width: 80,
              height: 80,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Inviti',
            style: TextStyle(
                fontSize: 18.0,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
          const Text(
            'The Harley Academy Community for',
            style: TextStyle(fontSize: 16.0, color: Colors.white),
          ),
          //const SizedBox(height: 2),
          const Text(
            'Aesthetic Education',
            style: TextStyle(fontSize: 16.0, color: Colors.white),
          ),
          const SizedBox(height: 30),
          GestureDetector(
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
                (route) => false,
              );
            },
            child: const Text(
              'Sign Out',
              style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.red,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 30.0),
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
