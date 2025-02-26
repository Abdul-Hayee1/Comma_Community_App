import 'package:flutter/material.dart';

// padding needs to be added on the sides of 18 yet..
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 20, 24, 33),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 100),

                Text(
                  'Welcome',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),

                SizedBox(height: 15),

                // User's First Name will be added here dynamically

                SizedBox(height: 150),

                // Buffering Lottie
                Icon(
                  Icons.lock,
                  color: Colors.white,
                ),

                SizedBox(height: 250),

                // Some Text
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18.0),
                  child: Row(
                    children: [
                      Text(
                        'We\'re loading your peronalized ',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Inviti ',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
                Text(
                  'acitvity feed',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),

                //Expanded(
                //child: Divider(),
                //)
              ],
            ),
          ),
        ),
      ),
      //bottomNavigationBar: Container(
      //decoration: const BoxDecoration(
      //border: Border(
      //top: BorderSide(color: Colors.white, width: 1),
      //),
      //),
      //),
    );
  }
}
