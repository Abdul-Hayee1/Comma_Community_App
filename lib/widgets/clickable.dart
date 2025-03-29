import 'package:flutter/material.dart';

class Clickable extends StatelessWidget {
  const Clickable({super.key, required this.onTap, required this.child});
  final void Function()? onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashFactory: NoSplash.splashFactory,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      focusColor: Colors.transparent,
      onTap: onTap,
      child: child,
    );
  }
}
