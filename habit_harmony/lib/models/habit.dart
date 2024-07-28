import 'package:cloud_firestore/cloud_firestore.dart';

class Habit {
  final String id; // Firestore document ID
  String name;
  int completedDays;
  int targetDays;
  List<DateTime> completedDates;
  bool isSelectedForToday;

  Habit({
    required this.id, // Initialize ID in constructor
    required this.name,
    required this.completedDays,
    required this.targetDays,
    required this.completedDates,
    this.isSelectedForToday = false,
  });

  // Convert from Firestore document to Habit
  factory Habit.fromFirestore(Map<String, dynamic> data, String id) {
    return Habit(
      id: id,
      name: data['name'],
      completedDays: data['completedDays'],
      targetDays: data['targetDays'],
      completedDates: (data['completedDates'] as List<dynamic>)
          .map((e) => (e as Timestamp).toDate())
          .toList(),
      isSelectedForToday: data['isSelectedForToday'] ?? false,
    );
  }

  // Convert Habit to Firestore document
  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'completedDays': completedDays,
      'targetDays': targetDays,
      'completedDates': completedDates.map((e) => Timestamp.fromDate(e)).toList(),
      'isSelectedForToday': isSelectedForToday,
    };
  }
}
