import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: Transform.translate(
            offset: const Offset(16, 0),
            child: const CircleAvatar(
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
          ),
          title: const Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(
              'Welcome!',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 24),
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 10, 39, 63),
          iconTheme: const IconThemeData(color: Colors.white),
          bottom: const TabBar(
            indicatorColor: Colors.blue,
            //indicatorWeight: 4.0,
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(
                width: 2.0,
                color: Colors.blue,
              ),
              insets: EdgeInsets.symmetric(horizontal: 24.0),
            ),
            //labelPadding: EdgeInsets.symmetric(horizontal: 16.0),
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
              ),
            ],
          ),
          elevation: 0,
          shadowColor: Colors.transparent,
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
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 8.0.h),
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
                  'Having trouble accessing\nyour plan?',
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
                      fontSize: 20,
                    ),
                    children: [
                      TextSpan(text: 'To access the '),
                      TextSpan(
                        text: 'Inviti',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: ' Plan, '),
                      TextSpan(
                          text: 'leave a\ncomment here',
                          style:
                              TextStyle(decoration: TextDecoration.underline)),
                    ],
                  ),
                ),
                SizedBox(height: 50.h),
                RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    children: [
                      TextSpan(text: 'If you\'re part of the '),
                      TextSpan(
                        text: 'Harley Academy,',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: '\nemail us here:\n'),
                      TextSpan(
                          text: 'comma@harleyacademy.com',
                          style:
                              TextStyle(decoration: TextDecoration.underline)),
                    ],
                  ),
                ),
                SizedBox(height: 80.h),
              ],
            ),
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
