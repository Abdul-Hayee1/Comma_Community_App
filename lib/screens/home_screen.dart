import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 20, 24, 33),
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Feed',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 20, 24, 33),
      ),
      drawer: Drawer(
        backgroundColor: const Color.fromARGB(255, 20, 24, 33),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 20, 24, 33),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(Icons.circle, color: Colors.blue, size: 30),
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Inviti',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            _buildDrawerItem(Icons.rss_feed, 'Feed'),
            _buildDrawerItem(Icons.explore, 'Discovery'),
            _buildDrawerItem(Icons.group, 'Members'),
            _buildDrawerItem(Icons.event, 'Events'),
            const Divider(color: Colors.grey),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Icon(Icons.arrow_drop_down, color: Colors.white),
                  SizedBox(width: 8),
                  Text('START HERE ⬇️', style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
            _buildDrawerItem(Icons.waving_hand, 'Welcome!', isBold: true),
            const Divider(color: Colors.grey),
            _buildDrawerItem(Icons.info_outline, 'See Network Details'),
            _buildDrawerItem(Icons.settings, 'Personal Settings'),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem(IconData icon, String title, {bool isBold = false}) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      onTap: () {},
    );
  }
}
