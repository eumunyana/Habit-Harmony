import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  final ThemeData _lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: Colors.white,
    hintColor: Colors.greenAccent,
  );

  final ThemeData _darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Colors.grey[900],
    hintColor: Colors.greenAccent,
  );

  ThemeData _currentTheme = ThemeData.light();

  ThemeData get lightTheme => _lightTheme;
  ThemeData get darkTheme => _darkTheme;
  ThemeData get currentTheme => _currentTheme;

  void toggleTheme() {
    _currentTheme = _currentTheme == _lightTheme ? _darkTheme : _lightTheme;
    notifyListeners();
  }
}
