import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../providers/habits_provider.dart';
import '../widgets/GifAnimationWidget.dart'; // Import your GIF animation widget

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          WeeklyCalendar(),
          SizedBox(height: 20),
          GifAnimationWidget(), // Your GIF animation widget
          SizedBox(height: 20),
          SizedBox(
            height: 400, // Adjust height as needed
            child: HabitList(),
          ),
        ],
      ),
    );
  }
}

class WeeklyCalendar extends StatelessWidget {
  const WeeklyCalendar({super.key});

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

class HabitList extends StatelessWidget {
  const HabitList({super.key});

  @override
  Widget build(BuildContext context) {
    final habitsProvider = Provider.of<HabitsProvider>(context);
    final habits = habitsProvider.habits;
    final today = DateTime.now();

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: habits.length,
      itemBuilder: (context, index) {
        final habit = habits[index];
        final isCompletedToday = habit.completedDates.contains(DateTime(today.year, today.month, today.day));

        return ListTile(
          title: Text(habit.name),
          subtitle: Text('${habit.completedDays} from ${habit.targetDays} target'),
          trailing: Checkbox(
            value: isCompletedToday,
            onChanged: (bool? value) {
              if (value == true) {
                habitsProvider.markHabitAsCompleted(index, DateTime(today.year, today.month, today.day));
              }
            },
          ),
        );
      },
    );
  }
}
