import 'package:flutter/material.dart';

class PasswordTextfield extends StatefulWidget {
  final TextEditingController? controller;
  final String hintText;
  final bool obscureText;
  final Color? borderColor;

  const PasswordTextfield({
    super.key,
    this.controller,
    required this.hintText,
    this.obscureText = false,
    this.borderColor,
  });

  @override
  State<PasswordTextfield> createState() => _MyTextfieldState();
}

class _MyTextfieldState extends State<PasswordTextfield> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: TextField(
        style: const TextStyle(color: Colors.white),
        controller: widget.controller,
        obscureText: _obscureText,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: widget.borderColor ?? Colors.grey,
              width: 2.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color:
                  widget.borderColor ?? const Color.fromARGB(255, 59, 76, 170),
              width: 2.0,
            ),
          ),
          fillColor: const Color.fromARGB(255, 44, 51, 61),
          filled: true,
          hintText: widget.hintText,
          hintStyle: TextStyle(color: Colors.grey[300]),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          suffixIcon: IconButton(
            icon: Icon(
              _obscureText ? Icons.visibility_off : Icons.visibility,
              color: Colors.grey[300],
            ),
            onPressed: _toggleVisibility,
          ),
        ),
      ),
    );
  }
}
