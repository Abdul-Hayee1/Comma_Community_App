// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class MyTextfield extends StatelessWidget {
  final controller;
  final String hintText;
  final double leftPadding;
  final double rightPadding;
  final Color? borderColor;

  const MyTextfield({
    super.key,
    required this.controller,
    required this.hintText,
    required this.leftPadding,
    required this.rightPadding,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: leftPadding, right: rightPadding),
      child: TextField(
        style: const TextStyle(color: Colors.white),
        controller: controller,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: borderColor ?? Colors.grey,
              width: 2.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: borderColor ?? const Color.fromARGB(255, 59, 76, 170),
              width: 2.0,
            ),
          ),
          fillColor: const Color.fromARGB(255, 44, 51, 61),
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey[300]),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        ),
      ),
    );
  }
}
