// ignore_for_file: use_build_context_synchronously

import 'dart:io';
import 'package:comma_community_app/modules/boarding/auth/view/auth_provider.dart';
import 'package:comma_community_app/widgets/my_button.dart';
import 'package:comma_community_app/widgets/my_textfield.dart';
import 'package:comma_community_app/widgets/password_textfield.dart';
import 'package:comma_community_app/widgets/social_logins.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreateAccountScreen extends ConsumerStatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  ConsumerState<CreateAccountScreen> createState() =>
      _CreateAccountScreenState();
}

class _CreateAccountScreenState extends ConsumerState<CreateAccountScreen> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _createAccount() async {
    try {
      await ref
          .read(authNotifierProvider.notifier)
          .createUserWithEmailAndPassword(
            firstName: _firstNameController.text,
            lastName: _lastNameController.text,
            email: _emailController.text,
            password: _passwordController.text,
          );

      final authState = ref.read(authNotifierProvider);
      FocusScope.of(context).unfocus();
      if (authState.value != null && ScaffoldMessenger.of(context).mounted) {
        Future.delayed(const Duration(milliseconds: 500), () {
          if (ScaffoldMessenger.of(context).mounted) {
            Navigator.pushNamed(
              context,
              "/addPhoto",
            );
          }
        });
      }
    } catch (_) {
      // Errors are handled through the UI
    }
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authNotifierProvider);
    final errorDetails = ref.watch(authErrorDetailsProvider);

    final emailError = errorDetails?['email'];
    final passwordError = errorDetails?['password'];
    final generalError = errorDetails?['general'];

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: const Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: CircleAvatar(
              radius: 30,
              backgroundColor: Color.fromARGB(255, 5, 35, 60),
              child: Image(
                image: AssetImage('assets/logos/app_logo.png'),
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
                      controller: _firstNameController,
                      hintText: 'First Name',
                      leftPadding: 18,
                      rightPadding: 3,
                    ),
                  ),
                  const SizedBox(width: 1),
                  Expanded(
                    child: MyTextfield(
                        controller: _lastNameController,
                        hintText: 'Last Name',
                        leftPadding: 3,
                        rightPadding: 18),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyTextfield(
                    controller: _emailController,
                    hintText: 'Email',
                    leftPadding: 18,
                    rightPadding: 18,
                    borderColor: emailError != null ? Colors.amber : null,
                  ),
                  if (emailError != null)
                    Padding(
                      padding: const EdgeInsets.only(left: 18, top: 4),
                      child: Text(
                        emailError,
                        style: const TextStyle(
                          color: Colors.amber,
                          fontSize: 12,
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PasswordTextfield(
                    controller: _passwordController,
                    hintText: 'Password',
                    obscureText: true,
                    borderColor: passwordError != null ? Colors.amber : null,
                  ),
                  if (passwordError != null)
                    Padding(
                      padding: const EdgeInsets.only(left: 18, top: 4),
                      child: Text(
                        passwordError,
                        style: const TextStyle(
                          color: Colors.amber,
                          fontSize: 12,
                        ),
                      ),
                    ),
                ],
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
              authState.when(
                loading: () => const Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                ),
                error: (error, stack) => MyButton(
                  hintText: 'Create Account',
                  bgcolor:
                      const Color.fromARGB(255, 70, 78, 185).withOpacity(0.5),
                  onPressed: _createAccount,
                  isOutlined: false,
                  isEnabled: false,
                ),
                data: (user) => MyButton(
                  hintText: 'Create Account',
                  bgcolor: const Color.fromARGB(255, 70, 78, 185),
                  onPressed: _createAccount,
                  isOutlined: false,
                ),
              ),
              if (generalError != null)
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text(
                    generalError,
                    style: const TextStyle(
                      color: Colors.amber,
                      fontSize: 14,
                    ),
                  ),
                ),
              const SizedBox(height: 30),
              Center(
                child: InkWell(
                  onTap: () => Navigator.pop(context),
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
              const SocialLogins(),
              const SizedBox(height: 15),
              if (Platform.isIOS) const Divider(color: Colors.grey),
              if (Platform.isIOS)
                Padding(
                  padding: const EdgeInsets.only(left: 3),
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 30,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
