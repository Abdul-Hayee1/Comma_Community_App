import 'package:comma_community_app/widgets/my_button.dart';
import 'package:comma_community_app/widgets/my_textfield.dart';
import 'package:comma_community_app/widgets/socials_button.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: CircleAvatar(
            backgroundColor: Colors.blue,
            radius: 18,
            child: Icon(
              Icons.copyright,
              color: Colors.white,
              size: 40,
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
                'Sign In',
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
                const SizedBox(height: 15),
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
                const SizedBox(height: 4),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forgot Password?',
                        style: TextStyle(color: Colors.grey[300], fontSize: 12),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                MyButton(
                  hintText: 'Sign In',
                  bgcolor: const Color.fromARGB(255, 70, 78, 185),
                  onPressed: () {
                    Navigator.pushNamed(context, "/welcome");
                  },
                  isOutlined: false,
                ),
                const SizedBox(height: 30),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, "/signUp");
                  },
                  child: const Text(
                    'Not a Member? Create Account',
                    style: TextStyle(color: Colors.white, fontSize: 16),
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
    );
  }
}
