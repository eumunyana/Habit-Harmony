import 'package:flutter/material.dart';
import '../models/habit.dart';

class HabitsProvider with ChangeNotifier {
  final List<Habit> _habits = [
    Habit(name: "Meditating", completedDays: 5, targetDays: 7, completedDates: []),
    Habit(name: "Read Philosophy", completedDays: 5, targetDays: 7, completedDates: []),
    Habit(name: "Journaling", completedDays: 2, targetDays: 7, completedDates: []),
  ];

  List<Habit> get habits => _habits;

  List<Habit> get uncompletedHabits => _habits.where((habit) => habit.completedDays < habit.targetDays).toList();

  void addHabit(Habit habit) {
    _habits.add(habit);
    notifyListeners();
  }

  void updateHabit(int index, Habit habit) {
    _habits[index] = habit;
    notifyListeners();
  }

  void deleteHabit(int index) {
    _habits.removeAt(index);
    notifyListeners();
  }

  void markHabitAsCompleted(int index, DateTime date) {
    if (!_habits[index].completedDates.contains(date)) {
      _habits[index].completedDates.add(date);
      _habits[index].completedDays++;
      notifyListeners();
    }
  }

  void removeCompletedDate(int index, DateTime date) {
    if (_habits[index].completedDates.contains(date)) {
      _habits[index].completedDates.remove(date);
      _habits[index].completedDays--;
      notifyListeners();
    }
  }

  void editHabit(int index, String newName, int newCompletedDays, int newTargetDays) {
    _habits[index].name = newName;
    _habits[index].completedDays = newCompletedDays;
    _habits[index].targetDays = newTargetDays;
    notifyListeners();
  }
}
