import 'package:flutter/material.dart';

class HabitStatAnimation extends StatefulWidget {
  const HabitStatAnimation({super.key});

  @override
  _HabitStatAnimationState createState() => _HabitStatAnimationState();
}

class _HabitStatAnimationState extends State<HabitStatAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);

    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Hello, keep it up!', // Greeting text
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Transform.scale(
              scale: 1 + _animation.value * 0.05, // Scale animation
              child: Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Text(
                    '🎉', // Emoji or any content you want to animate
                    style: TextStyle(fontSize: 40),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
