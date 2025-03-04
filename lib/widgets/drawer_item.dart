// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  DrawerItem({
    super.key,
    this.icon,
    required this.title,
    this.isBold = false,
    this.onTap,
  });

  IconData? icon;
  String title;
  bool isBold;
  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon != null ? Icon(icon, color: Colors.white) : null,
      title: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      onTap: onTap,
    );
  }
}
