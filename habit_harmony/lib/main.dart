import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:habit_harmony/firebase_options.dart';
import 'package:habit_harmony/widgets/navigation_bar.dart';
import 'package:provider/provider.dart';
import 'providers/habits_provider.dart';
import 'providers/appthemenotifier.dart';
import 'screens/auth_service.dart';
import 'screens/habits_screen.dart';
import 'screens/add_habit_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/login_screen.dart';
import 'screens/new_password_screen.dart';
import 'screens/password_reset_screen.dart';
import 'screens/stats_screen.dart';
import 'screens/account_screen.dart';
import 'screens/general_settings_screen.dart';
import 'screens/notifications_screen.dart';
import 'screens/privacy_screen.dart';
import 'screens/help_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
        Provider<AuthenticationService>(
          create: (_) => AuthenticationService(FirebaseAuth.instance),
          dispose: (_, AuthenticationService service) => service.signOut(),
        ),
        StreamProvider<User?>(
          create: (context) => context.read<AuthenticationService>().authStateChanges,
          initialData: null,
        ),
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
              '/signup': (context) => const SignUpScreen(),
              '/login': (context) => const LoginScreen(),
              '/new_password': (context) => const NewPasswordScreen(),
              '/password_reset': (context) => const PasswordResetScreen(),
              '/stats': (context) => const StatsScreen(),
              '/account': (context) =>  const AccountScreen(),
              '/general_settings': (context) =>  const GeneralSettingsScreen(),
              '/notifications': (context) =>  const NotificationsScreen(),
              '/privacy': (context) =>  const PrivacyScreen(),
              '/help': (context) =>  const HelpScreen(),
            },
          );
        },
      ),
    );
  }
}
