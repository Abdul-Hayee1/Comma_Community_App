import 'package:comma_community_app/modules/main/chat/view/chat_screen.dart';
import 'package:comma_community_app/modules/main/home/view/custom_appbars.dart';
import 'package:comma_community_app/modules/main/home/view/feed_screen.dart';
import 'package:comma_community_app/modules/main/home/view/main_profile_screen.dart';
import 'package:comma_community_app/modules/main/home/view/notifications_screen.dart';
import 'package:comma_community_app/modules/main/home/view/search_screen.dart';
import 'package:comma_community_app/widgets/drawer_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedIndexProvider = StateProvider<int>((ref) => 0);

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(selectedIndexProvider);

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 20, 24, 33),
        appBar: buildAppBar(selectedIndex, context),
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
              DrawerItem(icon: Icons.rss_feed, title: 'Feed'),
              DrawerItem(icon: Icons.explore, title: 'Discovery'),
              DrawerItem(icon: Icons.group, title: 'Members'),
              DrawerItem(icon: Icons.event, title: 'Events'),
              const Divider(color: Colors.grey),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Icon(Icons.arrow_drop_down, color: Colors.white),
                    SizedBox(width: 8),
                    Text('START HERE ⬇️',
                        style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
              DrawerItem(
                  icon: Icons.waving_hand, title: 'Welcome!', isBold: true),
              const Divider(color: Colors.grey),
              DrawerItem(
                  icon: Icons.info_outline, title: 'See Network Details'),
              DrawerItem(icon: Icons.settings, title: 'Personal Settings'),
            ],
          ),
        ),
        body: IndexedStack(
          index: selectedIndex,
          children: [
            FeedScreen(),
            ChatScreen(),
            const SearchScreen(),
            const NotificationsScreen(),
            const MainProfileScreen(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (index) =>
              ref.read(selectedIndexProvider.notifier).state = index,
          type: BottomNavigationBarType.fixed,
          backgroundColor: const Color.fromARGB(255, 35, 40, 50),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey[500],
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.explore),
              label: 'Feed',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: 'Chat',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: 'Notifications',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
