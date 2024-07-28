import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/habit.dart';

class DatabaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<Habit>> getUserHabits(String userId) {
    return _firestore
        .collection('users')
        .doc(userId)
        .collection('habits')
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) {
          final data = doc.data();
          return Habit(
            id: doc.id,
            name: data['name'],
            completedDays: data['completedDays'],
            targetDays: data['targetDays'],
            completedDates: List<DateTime>.from(
              (data['completedDates'] as List).map((date) => (date as Timestamp).toDate())
            ),
            isSelectedForToday: data['isSelectedForToday'] ?? false,
          );
        }).toList());
  }

  Future<void> addHabit(Habit habit) async {
    await _firestore.collection('users').doc(habit.id).collection('habits').add({
      'name': habit.name,
      'completedDays': habit.completedDays,
      'targetDays': habit.targetDays,
      'completedDates': habit.completedDates.map((date) => Timestamp.fromDate(date)).toList(),
      'isSelectedForToday': habit.isSelectedForToday,
    });
  }

  Future<void> updateHabit(Habit habit) async {
    await _firestore.collection('users').doc(habit.id).collection('habits').doc(habit.id).update({
      'name': habit.name,
      'completedDays': habit.completedDays,
      'targetDays': habit.targetDays,
      'completedDates': habit.completedDates.map((date) => Timestamp.fromDate(date)).toList(),
      'isSelectedForToday': habit.isSelectedForToday,
    });
  }

  Future<void> deleteHabit(String habitId) async {
    await _firestore.collection('users').doc(habitId).collection('habits').doc(habitId).delete();
  }
}
