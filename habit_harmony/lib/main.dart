import 'package:flutter/material.dart';
import 'package:habit_harmony/screens/add_habit_screen.dart';
import 'package:habit_harmony/screens/habits_screen.dart';
import 'package:habit_harmony/screens/settings_screen.dart';
import 'package:habit_harmony/widgets/navigation_bar.dart';
import 'package:provider/provider.dart';
import 'package:habit_harmony/providers/appthemenotifier.dart';
import 'package:habit_harmony/providers/habits_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AppThemeNotifier()),
        ChangeNotifierProvider(create: (context) => HabitsProvider()),
      ],
      child: Consumer<AppThemeNotifier>(
        builder: (context, themeNotifier, child) {
          return MaterialApp(
            title: 'Habit Harmony',
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            themeMode: themeNotifier.themeMode,
            initialRoute: '/',
            routes: {
              '/': (context) => const MyHomePage(),
              '/habits': (context) => const HabitsScreen(),
              '/add': (context) => AddHabitScreen(),
              '/settings': (context) => const SettingsScreen(),
            },
          );
        },
      ),
    );
  }
}
