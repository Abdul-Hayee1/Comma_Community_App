import 'package:flutter/material.dart';

void showAccountModalSheet(BuildContext context) {
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
      return _AccountSettingsModal();
    },
  );
}

class _AccountSettingsModal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
          ],
        ),
      ),
    );
  }
}
