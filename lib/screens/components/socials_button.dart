import 'package:flutter/material.dart';

class SocialsButton extends StatelessWidget {
  const SocialsButton({
    super.key,
    required this.hintText,
    required this.imagePath,
  });

  final String hintText;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6),
      margin: const EdgeInsets.symmetric(horizontal: 18),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: Colors.grey),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        //mainAxisSize: MainAxisSize.min, // Shrinks to fit content
        children: [
          Image.asset(
            imagePath,
            height: 20,
          ),
          const SizedBox(width: 5),
          Text(
            hintText,
            style: const TextStyle(fontSize: 16, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
