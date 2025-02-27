import 'package:flutter/material.dart';

class PendingApprovalScreen extends StatelessWidget {
  const PendingApprovalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text('Pending Approval'),
            Text('Your account is pending approval'),
            Text('Please wait for the admin to approve your account'),
          ],
        ),
      ),
    );
  }
}
