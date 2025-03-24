import 'package:comma_community_app/modules/main/welcome/access_inviti_tab.dart';
import 'package:comma_community_app/modules/main/welcome/page_tab.dart';
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
          children: [PageTab(), AccessInvitiTab()],
        ),
      ),
    );
  }
}
