import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    super.key,
    required this.hintText,
    required this.onPressed,
    required this.bgcolor,
    required this.isOutlined,
    this.isEnabled = true, // Disabled state support
  });

  final String hintText;
  final VoidCallback onPressed;
  final Color bgcolor;
  final bool isOutlined;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: isEnabled ? 1.0 : 0.5, // Visually dim when disabled
      child: GestureDetector(
        onTap: isEnabled ? onPressed : null, // Disable tap if not enabled
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
                color: isOutlined ? Colors.grey[400] : Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
