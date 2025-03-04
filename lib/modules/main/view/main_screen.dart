import 'package:comma_community_app/bottomModals/personal_settings_modal.dart';
import 'package:comma_community_app/modules/main/chat/view/chat_screen.dart';
import 'package:comma_community_app/core/utils/custom_appbars.dart';
import 'package:comma_community_app/modules/main/feed/view/feed_screen.dart';
import 'package:comma_community_app/modules/main/notifications/view/notifications_screen.dart';
import 'package:comma_community_app/modules/main/profile/view/profile_screen.dart';
import 'package:comma_community_app/modules/main/search/view/search_screen.dart';
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
                      radius: 28,
                      backgroundColor: Color.fromARGB(255, 5, 35, 60),
                      child: Image(
                        image: AssetImage(
                          'assets/logos/app_logo.png',
                        ),
                        width: 70,
                        height: 70,
                      ),
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                child: Divider(color: Colors.grey[600]),
              ),
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                child: Divider(color: Colors.grey[600]),
              ),
              DrawerItem(title: 'See Network Details'),
              DrawerItem(
                title: 'Personal Settings',
                onTap: () {
                  showPersonalSettingsModal(context);
                },
              ),
            ],
          ),
        ),
        body: IndexedStack(
          index: selectedIndex,
          children: const [
            FeedScreen(),
            ChatScreen(),
            SearchScreen(),
            NotificationsScreen(),
            ProfileScreen(),
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
