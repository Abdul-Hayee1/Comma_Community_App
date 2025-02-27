// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  DrawerItem({
    super.key,
    required this.icon,
    required this.title,
    this.isBold = false,
  });
  IconData icon;
  String title;
  bool isBold;

  @override
  Widget build(BuildContext context) {
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
