import 'package:flutter/material.dart';

class HabitCard extends StatelessWidget {
  final String habitName;
  final bool isCompleted;

  const HabitCard({super.key, required this.habitName, required this.isCompleted});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(habitName),
      trailing: Checkbox(
        value: isCompleted,
        onChanged: (bool? value) {
          // Handle checkbox state change
        },
      ),
    );
  }
}
