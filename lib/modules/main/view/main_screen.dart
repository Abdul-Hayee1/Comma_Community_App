// ignore_for_file: unused_local_variable

import 'package:comma_community_app/modules/boarding/auth/controller/auth_controller.dart';
import 'package:comma_community_app/modules/main/Discovery/discovery_screen.dart';
import 'package:comma_community_app/modules/main/events/events_screen.dart';
import 'package:comma_community_app/modules/main/members/members_screen.dart';
import 'package:comma_community_app/modules/main/profile/controller/profile_controller.dart';
import 'package:comma_community_app/modules/main/startHere/start_here.dart';
import 'package:comma_community_app/modules/main/startHere/welcome_screen.dart';
import 'package:comma_community_app/providers/auth_provider.dart';
import 'package:comma_community_app/providers/profile_provider.dart';
import 'package:comma_community_app/widgets/bottom_modal_sheets.dart';
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
final firstScreenProvider = StateProvider<Widget>((ref) => const FeedScreen());
final drawerItemSelectedProvider = StateProvider<bool>((ref) => false);
final drawerIndexProvider = StateProvider<int>((ref) => 0);
final welcomeVisibleProvider = StateProvider<bool>((ref) => true);

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(selectedIndexProvider);
    final firstScreen = ref.watch(firstScreenProvider);
    bool drawerItemSelected = ref.watch(drawerItemSelectedProvider);
    int drawerIndex = ref.watch(drawerIndexProvider);
    AuthController authController = ref.watch(authenticationNotifierProvider);
    AuthNotifier authNotifier =
        ref.read(authenticationNotifierProvider.notifier);
    ProfileController profileController = ref.watch(profileNotifierProvider);
    ProfileNotifier profileNotifier =
        ref.read(profileNotifierProvider.notifier);

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 20, 24, 33),
        appBar: drawerItemSelected
            ? buildAppBar(drawerIndex, context, authController, authNotifier)
            : buildAppBar(selectedIndex, context, authController, authNotifier),
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
              DrawerItem(
                icon: Icons.rss_feed,
                title: 'Feed',
                onTap: () {
                  ref.read(drawerIndexProvider.notifier).state = 0;
                  ref.read(drawerItemSelectedProvider.notifier).state = true;
                  ref.read(selectedIndexProvider.notifier).state = 0;
                  ref.read(firstScreenProvider.notifier).state =
                      const FeedScreen();
                  Navigator.pop(context);
                },
              ),
              DrawerItem(
                icon: Icons.explore,
                title: 'Discovery',
                onTap: () {
                  ref.read(drawerIndexProvider.notifier).state = 5;
                  ref.read(drawerItemSelectedProvider.notifier).state = true;
                  ref.read(selectedIndexProvider.notifier).state = 0;
                  ref.read(firstScreenProvider.notifier).state =
                      const DiscoveryScreen();
                  Navigator.pop(context);
                },
              ),
              DrawerItem(
                icon: Icons.group,
                title: 'Members',
                onTap: () {
                  ref.read(drawerIndexProvider.notifier).state = 6;
                  ref.read(drawerItemSelectedProvider.notifier).state = true;
                  ref.read(selectedIndexProvider.notifier).state = 0;
                  ref.read(firstScreenProvider.notifier).state =
                      const MembersScreen();
                  Navigator.pop(context);
                },
              ),
              DrawerItem(
                icon: Icons.event,
                title: 'Events',
                onTap: () {
                  ref.read(drawerIndexProvider.notifier).state = 7;
                  ref.read(drawerItemSelectedProvider.notifier).state = true;
                  ref.read(selectedIndexProvider.notifier).state = 0;
                  ref.read(firstScreenProvider.notifier).state =
                      const EventsScreen();
                  Navigator.pop(context);
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                child: Divider(color: Colors.grey[600]),
              ),
              GestureDetector(
                onTap: () {
                  ref.read(drawerIndexProvider.notifier).state = 8;
                  ref.read(drawerItemSelectedProvider.notifier).state = true;
                  ref.read(selectedIndexProvider.notifier).state = 0;
                  ref.read(firstScreenProvider.notifier).state =
                      const StartHereScreen();
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          ref.read(welcomeVisibleProvider.notifier).state =
                              !ref.read(welcomeVisibleProvider.notifier).state;
                        },
                        child: Icon(
                          ref.watch(welcomeVisibleProvider)
                              ? Icons.expand_more
                              : Icons.chevron_right,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'START HERE ⬇️',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              if (ref.watch(welcomeVisibleProvider))
                DrawerItem(
                  icon: Icons.home,
                  title: 'Welcome!',
                  isBold: true,
                  onTap: () {
                    ref.read(drawerIndexProvider.notifier).state = 9;
                    ref.read(drawerItemSelectedProvider.notifier).state = true;
                    ref.read(selectedIndexProvider.notifier).state = 0;
                    ref.read(firstScreenProvider.notifier).state =
                        const WelcomeScreen();
                    Navigator.pop(context);
                  },
                ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                child: Divider(color: Colors.grey[600]),
              ),
              DrawerItem(
                title: 'See Network Details',
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    "/network",
                  );
                },
              ),
              DrawerItem(
                title: 'Personal Settings',
                onTap: () {
                  showPersonalSettingsModal(context);
                },
              ),
            ],
          ),
        ),
        body: Stack(
          children: [
            IndexedStack(
              index: selectedIndex,
              children: [
                firstScreen,
                const ChatScreen(),
                const SearchScreen(),
                const NotificationsScreen(),
                const ProfileScreen(),
              ],
            ),
            // const ViewListProgress()
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (index) {
            ref.read(selectedIndexProvider.notifier).state = index;
            if (index != 0) {
              ref.read(drawerItemSelectedProvider.notifier).state = false;
            } else {
              ref.read(drawerItemSelectedProvider.notifier).state = true;
            }
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: const Color.fromARGB(255, 35, 40, 50),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey[500],
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            const BottomNavigationBarItem(
              icon: CircleAvatar(
                radius: 18,
                backgroundColor: Color.fromARGB(255, 5, 35, 60),
                child: Image(
                  image: AssetImage(
                    'assets/logos/app_logo.png',
                  ),
                  width: 70,
                  height: 70,
                ),
              ),
              label: 'Feed',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: 'Chat',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: 'Notifications',
            ),
            BottomNavigationBarItem(
              icon: CircleAvatar(
                radius: 18,
                backgroundImage: NetworkImage(
                  profileController.photoUrl,
                ),
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}

class ViewListProgress extends StatelessWidget {
  const ViewListProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 35, 40, 50),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: const SizedBox(
                      height: 10,
                      child: LinearProgressIndicator(
                        value: 0.0,
                        backgroundColor: Colors.white,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                      ),
                    ),
                  ),
                  const Text(
                    '20%',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 7),
            const Text(
              '0%',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 12),
            SizedBox(
              height: 30,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                child: const Text(
                  'View List',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
