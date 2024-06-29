// lib/providers/habit_model.dart

import 'package:flutter/material.dart';

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
