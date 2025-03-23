import 'package:flutter/material.dart';

class SigninLoadingScreen extends StatelessWidget {
  const SigninLoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 20, 24, 33),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 100),
              const Text(
                'Welcome',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              const SizedBox(height: 15),
              const SizedBox(height: 150),
              const Icon(
                Icons.lock,
                color: Colors.white,
              ),
              const SizedBox(height: 250),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: "We're loading your personalized ",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      TextSpan(
                        text: 'Inviti ',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Text(
                'activity feed',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
