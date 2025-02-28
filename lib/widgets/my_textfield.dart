import 'package:flutter/material.dart';

class MyTextfield extends StatelessWidget {
  final controller;
  final String hintText;
  final double leftPadding;
  final double rightPadding;

  const MyTextfield({
    super.key,
    required this.controller,
    required this.hintText,
    required this.leftPadding,
    required this.rightPadding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: leftPadding, right: rightPadding),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
              width: 2.0,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromARGB(255, 59, 76, 170),
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
