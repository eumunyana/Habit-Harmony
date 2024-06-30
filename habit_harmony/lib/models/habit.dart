class Habit {
  String name;
  int completedDays;
  int targetDays;
  List<DateTime> completedDates;
  bool isSelectedForToday; // New field

  Habit({
    required this.name,
    required this.completedDays,
    required this.targetDays,
    required this.completedDates,
    this.isSelectedForToday = false, // Default to false
  });
}
