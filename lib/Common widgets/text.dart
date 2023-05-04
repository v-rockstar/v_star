import 'package:flutter/material.dart';

class CommonText extends StatelessWidget {
  final String text;
  const CommonText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Text(
        text,
        style: const TextStyle(
            color: Colors.white,
            fontSize: 21,
            fontFamily: 'Oswald',
            fontWeight: FontWeight.w700),
      ),
    );
  }
}
