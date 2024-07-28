import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/habit.dart';

class HabitsProvider with ChangeNotifier {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  List<Habit> _habits = [];

  List<Habit> get habits => _habits;

  List<Habit> get uncompletedHabits =>
      _habits.where((habit) => habit.completedDays < habit.targetDays).toList();

  HabitsProvider() {
    _fetchHabits();
  }

  Future<void> _fetchHabits() async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId != null) {
      final snapshot = await _db.collection('habits').where('userId', isEqualTo: userId).get();
      _habits = snapshot.docs
          .map((doc) => Habit.fromFirestore(doc.data() as Map<String, dynamic>, doc.id))
          .toList();
      notifyListeners();
    }
  }

  Future<void> addHabit(Habit habit) async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId != null) {
      final docRef = _db.collection('habits').doc(habit.id);
      await docRef.set({
        ...habit.toFirestore(),
        'userId': userId,
      });
      _fetchHabits(); // Refresh the list
    }
  }

  Future<void> updateHabit(String id, Habit habit) async {
    await _db.collection('habits').doc(id).update(habit.toFirestore());
    _fetchHabits(); // Refresh the list
  }

  Future<void> deleteHabit(String id) async {
    await _db.collection('habits').doc(id).delete();
    _fetchHabits(); // Refresh the list
  }

  Future<void> markHabitAsCompleted(String id, DateTime date) async {
    final habitIndex = _habits.indexWhere((habit) => habit.id == id);
    if (habitIndex != -1) {
      if (!_habits[habitIndex].completedDates.contains(date)) {
        _habits[habitIndex].completedDates.add(date);
        _habits[habitIndex].completedDays++;
        await updateHabit(id, _habits[habitIndex]);
      }
    }
  }

  Future<void> removeCompletedDate(String id, DateTime date) async {
    final habitIndex = _habits.indexWhere((habit) => habit.id == id);
    if (habitIndex != -1) {
      if (_habits[habitIndex].completedDates.contains(date)) {
        _habits[habitIndex].completedDates.remove(date);
        _habits[habitIndex].completedDays--;
        await updateHabit(id, _habits[habitIndex]);
      }
    }
  }

  Future<void> editHabit(String id, String newName, int newCompletedDays, int newTargetDays) async {
    final habitIndex = _habits.indexWhere((habit) => habit.id == id);
    if (habitIndex != -1) {
      _habits[habitIndex].name = newName;
      _habits[habitIndex].completedDays = newCompletedDays;
      _habits[habitIndex].targetDays = newTargetDays;
      await updateHabit(id, _habits[habitIndex]);
    }
  }
}
