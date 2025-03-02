import 'package:comma_community_app/widgets/my_textfield.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});

  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                'Send a Magic Link',
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
                const SizedBox(height: 40),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    'Enter your email, and we\'ll send you a link to immediately sign in without a password.',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
                const SizedBox(height: 30),
                MyTextfield(
                  controller: _emailController,
                  hintText: 'Email',
                  leftPadding: 18,
                  rightPadding: 18,
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
