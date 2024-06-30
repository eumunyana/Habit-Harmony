import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/habits_provider.dart';
import '../models/habit.dart';

class AddHabitScreen extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _targetDaysController = TextEditingController();

  AddHabitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Habit'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Habit Name'),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _targetDaysController,
              decoration: const InputDecoration(labelText: 'Target Days'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                _addNewHabit(context);
              },
              child: const Text('Add Habit'),
            ),
          ],
        ),
      ),
    );
  }

  void _addNewHabit(BuildContext context) {
    final String name = _nameController.text.trim();
    final int targetDays = int.tryParse(_targetDaysController.text.trim()) ?? 0;

    if (name.isNotEmpty && targetDays > 0) {
      Habit newHabit = Habit(name: name, completedDays: 0, targetDays: targetDays, completedDates: []);
      Provider.of<HabitsProvider>(context, listen: false).addHabit(newHabit);

      // Navigate back to HabitsScreen after adding the habit
      Navigator.pop(context);
    } else {
      // Handle validation or show an error message
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text('Please enter valid habit name and target days.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }
}
