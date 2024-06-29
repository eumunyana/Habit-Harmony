import 'package:flutter/material.dart';

class HabitsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Habits"),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              // Show options for editing or deleting habits
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildHabitDetailItem(context, "Meditating", 5, 7),
          _buildHabitDetailItem(context, "Read Philosophy", 5, 7),
          _buildHabitDetailItem(context, "Journaling", 2, 7),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Action to add a new habit
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildHabitDetailItem(BuildContext context, String habit, int completedDays, int targetDays) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            habit,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Text("$completedDays from $targetDays target"),
              Spacer(),
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  // Action to edit habit
                },
              ),
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  // Action to delete habit
                },
              ),
            ],
          ),
          SizedBox(height: 8),
          LinearProgressIndicator(
            value: completedDays / targetDays,
            backgroundColor: Colors.grey[200],
            valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
          ),
        ],
      ),
    );
  }
}
