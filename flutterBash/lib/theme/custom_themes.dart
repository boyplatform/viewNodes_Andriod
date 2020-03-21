import 'package:flutter/material.dart';

final lightTheme = ThemeData.light();

final dartTheme = ThemeData.dark();

final yellowLightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.yellow,
    accentColor: Colors.yellowAccent);

class ThemesNotifier with ChangeNotifier {
  static ThemeData _currentTheme = yellowLightTheme;

  void setCurrentTheme(ThemeData themeData) {
    _currentTheme = themeData;
    notifyListeners();
  }

  get currentTheme => _currentTheme;
}
