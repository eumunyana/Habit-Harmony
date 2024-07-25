import 'package:flutter/material.dart';

class GifAnimationWidget extends StatelessWidget {
  const GifAnimationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/animations/Content_Plan1.gif', // Adjust the path as per your actual file location
      width: 300,
      height: 300,
      fit: BoxFit.contain,
    );
  }
}
