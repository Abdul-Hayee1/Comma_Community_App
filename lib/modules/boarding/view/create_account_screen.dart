import 'dart:io';

import 'package:comma_community_app/widgets/my_button.dart';
import 'package:comma_community_app/widgets/my_textfield.dart';
import 'package:comma_community_app/widgets/password_textfield.dart';
import 'package:comma_community_app/widgets/socials_button.dart';
import 'package:flutter/material.dart';

class CreateAccountScreen extends StatelessWidget {
  CreateAccountScreen({super.key});

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: const Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: CircleAvatar(
              backgroundColor: Colors.blue,
              child: Icon(
                Icons.copyright,
                color: Colors.white,
                size: 32,
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
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: MyTextfield(
                      controller: _emailController,
                      hintText: 'First Name',
                      leftPadding: 18,
                      rightPadding: 3,
                    ),
                  ),
                  const SizedBox(width: 1),
                  Expanded(
                    child: MyTextfield(
                      controller: _emailController,
                      hintText: 'Last Name',
                      leftPadding: 3,
                      rightPadding: 18,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              MyTextfield(
                controller: _emailController,
                hintText: 'Email',
                leftPadding: 18,
                rightPadding: 18,
              ),
              const SizedBox(height: 8),
              PasswordTextfield(
                controller: _passwordController,
                hintText: 'Password',
                obscureText: true,
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: RichText(
                  text: const TextSpan(
                    text: 'By creating an account, I agree to ',
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.white,
                    ),
                    children: [
                      TextSpan(
                        text: 'Comma User Agreement Terms ',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      TextSpan(
                        text: 'and the ',
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.white,
                        ),
                      ),
                      TextSpan(
                        text: 'Terms of Use ',
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.white,
                        ),
                      ),
                      TextSpan(
                        text: 'and ',
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.white,
                        ),
                      ),
                      TextSpan(
                        text: 'Privacy Policy ',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      TextSpan(
                        text: 'of the service provider.',
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              MyButton(
                hintText: 'Create Account',
                bgcolor: const Color.fromARGB(255, 70, 78, 185),
                onPressed: () {
                  Navigator.pushNamed(context, "/addPhoto");
                },
                isOutlined: false,
              ),
              const SizedBox(height: 30),
              Center(
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Already a Member? Sign in',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
              const SizedBox(height: 22),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Divider(
                  thickness: 1,
                  color: Colors.grey[700],
                ),
              ),
              const SizedBox(height: 25),
              const Padding(
                padding: EdgeInsets.only(left: 18),
                child: Text(
                  'Or Use',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
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
              const SizedBox(height: 15),
              if (Platform.isIOS)
                const Divider(
                  color: Colors.grey,
                ),
              if (Platform.isIOS)
                Padding(
                  padding: const EdgeInsets.only(left: 3),
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 30,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
