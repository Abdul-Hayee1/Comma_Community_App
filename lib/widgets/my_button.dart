import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    super.key,
    required this.hintText,
    required this.onPressed,
  });

  final String hintText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.symmetric(horizontal: 18.0),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 70, 78, 185),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Center(
          child: Text(
            hintText,
            style: TextStyle(
              color: Colors.grey[400],
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
