import 'package:comma_community_app/widgets/my_button.dart';
import 'package:comma_community_app/widgets/my_textfield.dart';
import 'package:comma_community_app/widgets/socials_button.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.lock,
          size: 30,
          color: Colors.white,
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
              'Create Account',
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                MyTextfield(
                  controller: _emailController,
                  hintText: 'Email',
                  obscureText: false,
                ),
                const SizedBox(height: 8),
                MyTextfield(
                  controller: _passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),
                const SizedBox(height: 50),
                MyButton(
                  hintText: 'Create Account',
                  onPressed: () {
                    Navigator.pushNamed(context, "/home");
                  },
                ),
                const SizedBox(height: 30),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Already a Member? Sign in',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
                const SizedBox(height: 22),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 25),
                const Row(
                  children: [
                    SizedBox(width: 18),
                    Text(
                      'Or Use',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                const SocialsButton(
                  hintText: 'Sign In with Google',
                  imagePath: 'assets/logos/google_logo.png',
                ),
                const SizedBox(height: 12),
                const SocialsButton(
                  hintText: 'Sign In with Facebook',
                  imagePath: 'assets/logos/facebook.png',
                ),
                const SizedBox(height: 12),
                const SocialsButton(
                  hintText: 'Sign In with LinkedIn',
                  imagePath: 'assets/logos/linkedin_logo.png',
                ),
                const SizedBox(height: 12),
                const SocialsButton(
                  hintText: 'Sign In with Apple',
                  imagePath: 'assets/logos/apple_logo.png',
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(color: Colors.white, width: 1),
          ),
        ),
        child: BottomAppBar(
          color: const Color.fromARGB(255, 20, 24, 33),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back,
                      color: Colors.white, size: 40),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
