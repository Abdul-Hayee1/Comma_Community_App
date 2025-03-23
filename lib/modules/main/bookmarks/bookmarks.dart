import 'package:flutter/material.dart';

class BookmarksScreen extends StatelessWidget {
  const BookmarksScreen({super.key});

  PreferredSizeWidget _buildDivider() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(1),
      child: Divider(height: 1, color: Colors.grey.shade800),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 20, 24, 33),
        appBar: AppBar(
          title: const Text(
            "Bookmarks",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          bottom: _buildDivider(),
          backgroundColor: const Color.fromARGB(255, 10, 39, 63),
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          width: double.infinity,
          height: 100,
          color: Colors.grey[900],
          child: const Center(
            child: Text(
              'Looks like you don\'t have any bookmarks.',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}
