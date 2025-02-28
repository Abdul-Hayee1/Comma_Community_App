import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 20, 24, 33),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 100),
              Text(
                'Welcome',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              SizedBox(height: 15),
              SizedBox(height: 150),
              Icon(
                Icons.lock,
                color: Colors.white,
              ),
              SizedBox(height: 250),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.0),
                child: RichText(
                  text: TextSpan(
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
              Text(
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
