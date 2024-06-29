import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WeeklyCalendar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();
    final startOfWeek = today.subtract(Duration(days: today.weekday - 1));
    final daysOfWeek = List.generate(7, (index) => startOfWeek.add(Duration(days: index)));

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: daysOfWeek.map((date) {
        final isToday = date.day == today.day && date.month == today.month && date.year == today.year;
        return Column(
          children: [
            Text(
              DateFormat('EEE').format(date), // Mon, Tue, etc.
              style: TextStyle(
                color: isToday ? Colors.green : Colors.grey,
                fontWeight: isToday ? FontWeight.bold : FontWeight.normal,
              ),
            ),
            Text(
              DateFormat('d MMM').format(date), // 21 Jun, 22 Jun, etc.
              style: TextStyle(
                color: isToday ? Colors.green : Colors.grey,
                fontWeight: isToday ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        );
      }).toList(),
    );
  }
}
