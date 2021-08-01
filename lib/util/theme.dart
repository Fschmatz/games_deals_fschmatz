import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

//CLARO
ThemeData light = ThemeData(
    brightness: Brightness.light,
    primaryColor: Color(0xFFF3F3F3),
    accentColor: Colors.purple,
    scaffoldBackgroundColor: Color(0xFFF3F3F3),
    cardTheme: CardTheme(
      color: Color(0xFFFFFFFF),
    ),
    dialogTheme: DialogTheme(
      backgroundColor: Color(0xFFF9F9F9),
    ),
    inputDecorationTheme: InputDecorationTheme(
        contentPadding: EdgeInsets.symmetric(
            vertical: 15.0, horizontal: 10.0),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
          ),
          borderRadius: BorderRadius.circular(15.0),
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(15.0)),
        border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(15.0))
    ),
    accentTextTheme: TextTheme(
      headline1: TextStyle(color:  Color(0xFFd373f0)),
      headline2: TextStyle(color:  Color(0xFF845194)),
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
    inputDecorationTheme: InputDecorationTheme(
        contentPadding: EdgeInsets.symmetric(
            vertical: 15.0, horizontal: 10.0),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFFD46062),
          ),
          borderRadius: BorderRadius.circular(15.0),
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(15.0)),
        border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(15.0))
    ),
    accentTextTheme: TextTheme(
      headline1: TextStyle(color:  Color(0xFFc9a5d4)),
      headline2: TextStyle(color:  Color(0xFF826a8a)),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      showSelectedLabels: false,
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
