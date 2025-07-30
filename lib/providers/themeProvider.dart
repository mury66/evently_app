import 'package:flutter/material.dart';

import '../casheHelper/sharedPreferences.dart';

class ThemeProvider extends ChangeNotifier
{
  ThemeMode _themeMode = ThemeMode.light;
  ThemeMode get themeMode => _themeMode;
  ThemeProvider() {
    _loadThemeFromPrefs();
  }
  void _loadThemeFromPrefs() async {
    final isDark = SharedPreferencesHelper.getDarkMode();
    _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  void setThemeMode(ThemeMode mode) {
    if (mode == _themeMode) return; // Avoid unnecessary updates
    _themeMode = mode;
    notifyListeners();
  }
  void swithThemeMode() {
    _themeMode = _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  bool get isDarkMode => _themeMode == ThemeMode.dark;
  bool get isLightMode => _themeMode == ThemeMode.light;

}