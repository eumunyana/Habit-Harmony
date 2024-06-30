import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/habit.dart';
import '../providers/habits_provider.dart';

class HabitsScreen extends StatelessWidget {
  const HabitsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Habits"),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              // Show options for editing or deleting habits
            },
          ),
        ],
      ),
      body: Consumer<HabitsProvider>(
        builder: (context, habitsProvider, child) {
          return ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: habitsProvider.habits.length,
            itemBuilder: (context, index) {
              final Habit habit = habitsProvider.habits[index];
              return _buildHabitDetailItem(context, habit, index);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add');
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildHabitDetailItem(BuildContext context, Habit habit, int index) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        //color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            habit.name,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Text("${habit.completedDays} from ${habit.targetDays} target"),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () {
                  _showEditHabitDialog(context, habit, index);
                },
              ),
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  Provider.of<HabitsProvider>(context, listen: false).deleteHabit(index);
                },
              ),
            ],
          ),
          const SizedBox(height: 8),
          LinearProgressIndicator(
            value: habit.completedDays / habit.targetDays,
            backgroundColor: Colors.grey[200],
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
          ),
        ],
      ),
    );
  }

  void _showEditHabitDialog(BuildContext context, Habit habit, int index) {
    TextEditingController nameController = TextEditingController(text: habit.name);
    TextEditingController completedDaysController = TextEditingController(text: habit.completedDays.toString());
    TextEditingController targetDaysController = TextEditingController(text: habit.targetDays.toString());

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Edit Habit"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: "Habit Name"),
              ),
              TextField(
                controller: completedDaysController,
                decoration: const InputDecoration(labelText: "Completed Days"),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: targetDaysController,
                decoration: const InputDecoration(labelText: "Target Days"),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text("Save"),
              onPressed: () {
                _editHabit(
                  context,
                  index,
                  nameController.text,
                  int.parse(completedDaysController.text),
                  int.parse(targetDaysController.text),
                );
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _editHabit(BuildContext context, int index, String newName, int newCompletedDays, int newTargetDays) {
    Provider.of<HabitsProvider>(context, listen: false).editHabit(
      index,
      newName,
      newCompletedDays,
      newTargetDays,
    );
  }
}
