import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    super.key,
    required this.hintText,
    required this.onPressed,
    required this.bgcolor,
    required this.isOutlined,
  });

  final String hintText;
  final VoidCallback onPressed;
  final Color bgcolor;
  final bool isOutlined;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.symmetric(horizontal: 18.0),
        decoration: BoxDecoration(
          color: isOutlined ? Colors.transparent : bgcolor,
          borderRadius: BorderRadius.circular(4),
          border: isOutlined ? Border.all(color: Colors.grey) : null,
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
