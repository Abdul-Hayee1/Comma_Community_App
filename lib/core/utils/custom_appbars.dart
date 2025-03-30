// ignore_for_file: avoid_print, use_build_context_synchronously
import 'package:comma_community_app/modules/boarding/auth/controller/auth_controller.dart';
import 'package:comma_community_app/providers/auth_provider.dart';
import 'package:comma_community_app/widgets/bottom_modal_sheets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

String _selectedSortOption = "Last Activity";
List<String> _selectedFilters = [];

List<String> _filterOptions = [
  "Everything",
  "Your Activity",
  "From Your Hosts",
  "Near You",
  "Unanswered",
  "Quick Posts",
  "Questions & Polls",
  "Events",
];

List<String> _sortOptions = [
  "Last Activity",
  "Popular Now",
  "Newest",
  "Oldest",
  "Distance",
];

PreferredSizeWidget buildAppBar(int index, BuildContext context,
    AuthController authController, AuthNotifier authNotifier) {
  switch (index) {
    case 0:
      return AppBar(
        title: Text(
          "Feed",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16.sp),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              _showFilterAndSortModal(context);
            },
            icon: const Icon(
              Icons.filter_list,
              color: Colors.white,
            ),
          )
        ],
        bottom: _buildDivider(),
        backgroundColor: const Color.fromARGB(255, 10, 39, 63),
        iconTheme: const IconThemeData(color: Colors.white),
      );
    case 1:
      return AppBar(
        title: Text("Chat",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16.sp)),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                showAddNewChatModal(context);
              },
              icon: const Icon(Icons.add)),
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "/searchChat");
              },
              icon: const Icon(Icons.search)),
          IconButton(
              onPressed: () {
                showSearchOptionsModal(context);
              },
              icon: const Icon(Icons.settings)),
        ],
        backgroundColor: const Color.fromARGB(255, 10, 39, 63),
        iconTheme: const IconThemeData(color: Colors.white),
      );
    case 2:
      return AppBar(
        title: Text("Search",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16.sp)),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
        ],
        bottom: _buildDivider(),
        backgroundColor: const Color.fromARGB(255, 10, 39, 63),
        iconTheme: const IconThemeData(color: Colors.white),
      );
    case 3:
      return AppBar(
        title: Text(
          "Notifications",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16.sp),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                showNotificationsSettingsModal(context);
              },
              icon: const Icon(Icons.settings)),
        ],
        bottom: _buildDivider(),
        backgroundColor: const Color.fromARGB(255, 10, 39, 63),
        iconTheme: const IconThemeData(color: Colors.white),
      );
    case 4:
      return AppBar(
        title: Text(
          "Your Profile",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16.sp),
        ),
        centerTitle: true,
        bottom: _buildDivider(),
        backgroundColor: const Color.fromARGB(255, 10, 39, 63),
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            onPressed: () async {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.blue,
                    ),
                  );
                },
              );

              await authNotifier.signOut();
              OneSignal.shared.deleteTag("user_id");
              Navigator.pushReplacementNamed(context, "/");
            },
            icon: const Icon(
              Icons.exit_to_app,
            ),
          ),
        ],
      );
    case 5:
      return AppBar(
        title: Text(
          "Discovery",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16.sp),
        ),
        centerTitle: true,
        bottom: _buildDivider(),
        backgroundColor: const Color.fromARGB(255, 10, 39, 63),
        iconTheme: const IconThemeData(color: Colors.white),
      );
    case 6:
      return AppBar(
        title: Text(
          "Members",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16.sp),
        ),
        centerTitle: true,
        bottom: _buildDivider(),
        backgroundColor: const Color.fromARGB(255, 10, 39, 63),
        iconTheme: const IconThemeData(color: Colors.white),
      );
    case 7:
      return AppBar(
        title: Text(
          "Events",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16.sp),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "/calendar");
              },
              icon: const Icon(Icons.event)),
        ],
        bottom: _buildDivider(),
        backgroundColor: const Color.fromARGB(255, 10, 39, 63),
        iconTheme: const IconThemeData(color: Colors.white),
      );
    case 8:
      return AppBar(
        title: Text(
          "START HERE ⬇️",
          style: TextStyle(
              color: Colors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        bottom: _buildDivider(),
        backgroundColor: const Color.fromARGB(255, 10, 39, 63),
        iconTheme: const IconThemeData(color: Colors.white),
      );
    case 9:
      return AppBar(
        actions: [
          IconButton(
            onPressed: () {
              showWelcomeScreenModalSheet(context);
            },
            icon: const Icon(Icons.more_vert),
          ),
        ],
        backgroundColor: const Color.fromARGB(255, 10, 39, 63),
        iconTheme: const IconThemeData(color: Colors.white),
      );
    default:
      return AppBar(
        title: const Text("Default"),
        bottom: _buildDivider(),
        backgroundColor: const Color.fromARGB(255, 10, 39, 63),
        iconTheme: const IconThemeData(color: Colors.white),
      );
  }
}

PreferredSizeWidget _buildDivider() {
  return PreferredSize(
    preferredSize: const Size.fromHeight(1),
    child: Divider(height: 1, color: Colors.grey.shade800),
  );
}

void _showFilterAndSortModal(BuildContext context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: const Color(0xFF0A273F),
    isScrollControlled: true,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16, top: 32),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(Icons.close, color: Colors.white),
                        ),
                        const Text(
                          "Filter and Sort",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            print("Selected Filters: $_selectedFilters");
                            print("Selected Sort: $_selectedSortOption");
                          },
                          child: const Text(
                            "DONE",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "By default we show your Personal Feed\n based on things you follow.",
                      style: TextStyle(color: Colors.white70),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    const Padding(
                      padding: EdgeInsets.only(left: 18),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Filter by...",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Column(
                      children: _filterOptions.map((option) {
                        return _buildFilterOption(option, setState);
                      }).toList(),
                    ),
                    const SizedBox(height: 16),
                    const Padding(
                      padding: EdgeInsets.only(left: 18),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Sort by...",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Column(
                      children: _sortOptions.map((option) {
                        return _buildSortOption(option, setState);
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    },
  );
}

Widget _buildFilterOption(String title, Function setState) {
  bool isSelected = _selectedFilters.contains(title);
  return ListTile(
    leading: Icon(
      isSelected ? Icons.check_box : Icons.check_box_outline_blank,
      color: Colors.white,
    ),
    title: Text(
      title,
      style: const TextStyle(
        color: Colors.white,
      ),
    ),
    onTap: () {
      setState(() {
        isSelected
            ? _selectedFilters.remove(title)
            : _selectedFilters.add(title);
      });
    },
  );
}

Widget _buildSortOption(String title, Function setState) {
  return ListTile(
    leading: Icon(
      _selectedSortOption == title
          ? Icons.radio_button_checked
          : Icons.radio_button_unchecked,
      color: Colors.white,
    ),
    title: Text(
      title,
      style: const TextStyle(
        color: Colors.white,
      ),
    ),
    onTap: () {
      setState(() {
        _selectedSortOption = title;
      });
    },
  );
}
