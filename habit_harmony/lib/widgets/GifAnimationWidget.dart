import 'package:flutter/material.dart';

class GifAnimationWidget extends StatelessWidget {
  const GifAnimationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/animations/Content_Plan.gif', // Adjust the path as per your actual file location
      width: 200,
      height: 200,
      fit: BoxFit.contain,
    );
  }
}
