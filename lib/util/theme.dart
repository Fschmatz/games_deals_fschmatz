import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

//CLARO
ThemeData light = ThemeData(
    brightness: Brightness.light,
    primaryColor: Color(0xFFFFFFFF),
    accentColor: Colors.purple[600],
    scaffoldBackgroundColor: Color(0xFFFFFFFF),
    cardTheme: CardTheme(
      color: Color(0xFFFFFFFF),
    ),
    dialogTheme: DialogTheme(
      backgroundColor: Color(0xFFF9F9F9),
    ),
    accentTextTheme: TextTheme(
      headline1: TextStyle(color: Color(0xFFab3cc9)),
      headline2: TextStyle(color: Color(0xFFc790de)),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      showSelectedLabels: false,
      showUnselectedLabels: true,
      backgroundColor: Color(0xFFE0E0E0),
    ),
    bottomAppBarColor: Color(0xFFE0E0E0),
    bottomSheetTheme:
        BottomSheetThemeData(modalBackgroundColor: Color(0xFFF3F3F3)));

//ESCURO
ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Color(0xFF202020),
    accentColor: Color(0xFFB17FBF),
    scaffoldBackgroundColor: Color(0xFF202020),
    cardTheme: CardTheme(
      color: Color(0xFF2D2D2D),
    ),
    dialogTheme: DialogTheme(
      backgroundColor: Color(0xFF292929),
    ),
    accentTextTheme: TextTheme(
      headline1: TextStyle(color: Color(0xFFc9a5d4)),
      headline2: TextStyle(color: Color(0xFF4f4452)),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      showSelectedLabels: true,
      showUnselectedLabels: true,
      backgroundColor: Color(0xFF151515),
    ),
    bottomAppBarColor: Color(0xFF151515),
    bottomSheetTheme:
        BottomSheetThemeData(modalBackgroundColor: Color(0xFF202020)));

class ThemeNotifier extends ChangeNotifier {
  final String key = 'valorTema';
  late SharedPreferences prefs;
  late bool _darkTheme;

  bool get darkTheme => _darkTheme;

  ThemeNotifier() {
    _darkTheme = true;
    _loadFromPrefs();
  }

  toggleTheme() {
    _darkTheme = !_darkTheme;
    _saveToPrefs();
    notifyListeners();
  }

  _initPrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  _loadFromPrefs() async {
    await _initPrefs();
    _darkTheme = prefs.getBool(key) ?? true;
    notifyListeners();
  }

  _saveToPrefs() async {
    await _initPrefs();
    prefs.setBool(key, _darkTheme);
  }
}
