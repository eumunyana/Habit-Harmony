import 'package:flutter/material.dart';
import 'package:habit_harmony/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => HabitModel(),
      child: const HabitHarmonyApp(),
    ),
  );
}

class HabitModel with ChangeNotifier {
  final List<Habit> _habits = [];

  List<Habit> get habits => _habits;

  void addHabit(Habit habit) {
    _habits.add(habit);
    notifyListeners();
  }

  void removeHabit(Habit habit) {
    _habits.remove(habit);
    notifyListeners();
  }
}

class Habit {
  String name;
  bool isCompleted;

  Habit({required this.name, this.isCompleted = false});
}

class HabitHarmonyApp extends StatelessWidget {
  const HabitHarmonyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
