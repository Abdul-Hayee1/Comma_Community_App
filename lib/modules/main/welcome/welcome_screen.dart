import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: const CircleAvatar(
            radius: 28,
            backgroundColor: Colors.white,
            child: Image(
              image: AssetImage(
                'assets/logos/app_logo.png',
              ),
              width: 70,
              height: 70,
            ),
          ),
          title: const Text(
            'Welcome',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: const Color.fromARGB(255, 10, 39, 63),
          iconTheme: const IconThemeData(color: Colors.white),
          bottom: const TabBar(
            tabs: [
              Tab(
                child: Text(
                  'Page',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Tab(
                child: Text(
                  'Access Comma',
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ),
        body: const TabBarView(
          children: [PageTab(), AccessCommaTab()],
        ),
      ),
    );
  }
}

class PageTab extends StatelessWidget {
  const PageTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ColoredBox(
        color: const Color.fromARGB(255, 10, 39, 63),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Welcome to Inviti: The\nHarley Academy Community\nfor Aesthetic Education.',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22),
              ),
              RichText(
                text: const TextSpan(
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                  children: [
                    TextSpan(text: 'Established in 2025, '),
                    TextSpan(
                      text: 'Inviti',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                        text:
                            ' has\nbecome a fantastic hub of knowledge\nand purpose that connects aesthetic medicine professionals from around the world.'),
                  ],
                ),
              ),
              const Divider(
                thickness: 1,
                color: Colors.grey,
              ),
              const Text(
                'Inviti Guidelines',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              const Text(
                'you can read the Inviti guidelines',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              const Text(
                'here.',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    decoration: TextDecoration.underline),
              ),
              const Divider(
                thickness: 1,
                color: Colors.grey,
              ),
              const Text(
                'Having trouble accessing your plan?',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              RichText(
                text: const TextSpan(
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  children: [
                    TextSpan(text: 'To access the '),
                    TextSpan(
                      text: 'Inviti',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: 'for Aesthetic Education.'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AccessCommaTab extends StatelessWidget {
  const AccessCommaTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [Text('Access Comma')],
        ),
      ),
    );
  }
}
