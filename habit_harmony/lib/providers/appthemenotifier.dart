import 'package:flutter/material.dart';

class AppThemeNotifier with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;

  ThemeMode get themeMode => _themeMode;

  void updateTheme(ThemeMode mode) {
    _themeMode = mode;
    notifyListeners();
  }
}
