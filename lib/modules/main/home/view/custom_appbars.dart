import 'package:flutter/material.dart';

PreferredSizeWidget buildAppBar(int index, dynamic align) {
  switch (index) {
    case 0:
      return AppBar(
        title: const Text(
          "Feed",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.filter_list))],
        bottom: _buildDivider(),
        backgroundColor: const Color.fromARGB(255, 10, 39, 63),
        iconTheme: const IconThemeData(color: Colors.white),
      );
    case 1:
      return AppBar(
        title: const Text("Chat", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
        ],
        backgroundColor: const Color.fromARGB(255, 10, 39, 63),
        iconTheme: const IconThemeData(color: Colors.white),
      );
    case 2:
      return AppBar(
        title: const Text("Search", style: TextStyle(color: Colors.white)),
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
        title: const Text(
          "Notifications",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
        ],
        bottom: _buildDivider(),
        backgroundColor: const Color.fromARGB(255, 10, 39, 63),
        iconTheme: const IconThemeData(color: Colors.white),
      );
    case 4:
      return AppBar(
        title: const Text(
          "Your Profile",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        bottom: _buildDivider(),
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
    preferredSize: Size.fromHeight(1),
    child: Divider(height: 1, color: Colors.grey.shade800),
  );
}
