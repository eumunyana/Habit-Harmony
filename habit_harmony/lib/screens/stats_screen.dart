import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../providers/habits_provider.dart';
import '../models/habit.dart'; // Assuming you have this import for the Habit model

class StatsScreen extends StatelessWidget {
  const StatsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('assets/icons/profile.png'), // Profile image path
              ),
              SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Marie"),
                  Text("1452 Points", style: TextStyle(fontSize: 14)),
                ],
              ),
            ],
          ),
          bottom: TabBar(
            tabs: [
              Tab(text: "Daily"),
              Tab(text: "Weekly"),
              Tab(text: "Monthly"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildStatsView(context, "Daily"),
            _buildStatsView(context, "Weekly"),
            _buildStatsView(context, "Monthly"),
          ],
        ),
      ),
    );
  }

  Widget _buildStatsView(BuildContext context, String period) {
    return Consumer<HabitsProvider>(
      builder: (context, habitsProvider, child) {
        final totalHabits = habitsProvider.habits.length;
        final completedHabits = habitsProvider.habits
            .where((habit) => habit.completedDays == habit.targetDays)
            .length;

        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Summary Section
                Text(
                  "All Habits",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildSummaryItem("Success Rate", "${(completedHabits / totalHabits * 100).toStringAsFixed(1)}%"),
                    _buildSummaryItem("Completed", "$completedHabits"),
                    _buildSummaryItem("Best Streak Day", "22"), // Placeholder value
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildSummaryItem("Points Earned", "322"), // Placeholder value
                    _buildSummaryItem("Skipped", "0"), // Placeholder value
                    _buildSummaryItem("Failed", "0"), // Placeholder value
                  ],
                ),
                SizedBox(height: 16),
                // Graph Section
                Text(
                  "Habits Comparison by $period",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                SizedBox(
                  height: 400, // Fixed height for the chart
                  child: _buildBarChart(habitsProvider.habits),
                ),
                SizedBox(height: 16),
                // Habit List
                ListView.builder(
                  shrinkWrap: true, // Allow ListView to take only the needed space
                  physics: NeverScrollableScrollPhysics(), // Disable ListView's own scrolling
                  itemCount: habitsProvider.habits.length,
                  itemBuilder: (context, index) {
                    final habit = habitsProvider.habits[index];
                    final completionPercentage =
                        (habit.completedDays / habit.targetDays * 100).toStringAsFixed(1);

                    return ListTile(
                      title: Text(habit.name),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${habit.completedDays} from ${habit.targetDays} target",
                          ),
                          Text(
                            "Completion: $completionPercentage%",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                      trailing: SizedBox(
                        width: 100, // Adjust the width as needed
                        child: LinearProgressIndicator(
                          value: habit.completedDays / habit.targetDays,
                          backgroundColor: Colors.grey[200],
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildSummaryItem(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 14, color: Colors.grey),
        ),
        SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildBarChart(List<Habit> habits) {
    List<ChartData> data = habits.map((habit) {
      final completionPercentage = (habit.completedDays / habit.targetDays * 100).toStringAsFixed(1);
      return ChartData(habit.name, habit.completedDays.toDouble());
    }).toList();

    return SfCartesianChart(
      primaryXAxis: CategoryAxis(),
      series: <ChartSeries>[
        BarSeries<ChartData, String>(
          dataSource: data,
          xValueMapper: (ChartData data, _) => data.habitName,
          yValueMapper: (ChartData data, _) => data.completedDays,
          color: Colors.lightBlueAccent,
        ),
      ],
    );
  }
}

class ChartData {
  final String habitName;
  final double completedDays;

  ChartData(this.habitName, this.completedDays);
}
