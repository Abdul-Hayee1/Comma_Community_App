import 'package:flutter/material.dart';

class AccessInvitiTab extends StatelessWidget {
  const AccessInvitiTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: ColoredBox(
        color: Color.fromARGB(255, 10, 39, 63),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'You are all caught up!',
                  style: TextStyle(color: Colors.grey),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
