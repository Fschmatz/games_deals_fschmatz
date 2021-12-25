import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

//CLARO
ThemeData light = ThemeData(
    brightness: Brightness.light,
    primaryColorBrightness: Brightness.dark,
    primaryColor: const Color(0xFFFEFFFE),
    accentColor: Colors.purple[400],
    scaffoldBackgroundColor: const Color(0xFFFEFFFE),
    colorScheme: ColorScheme.light(
      primary:  Colors.purple[400]!,
      primaryVariant:  Colors.purple[400]!,
      onSecondary: const Color(0xFF050505),
      secondary: Colors.purple[400]!,
    ),
    appBarTheme: const AppBarTheme(
        color: Color(0xFFFEFFFE),
        elevation: 0,
        iconTheme: IconThemeData(color: Color(0xFF050505)),
        titleTextStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Color(0xFF000000))),
    cardTheme: const CardTheme(
      color: Color(0xFFF3F4F3),
    ),
    dialogTheme: const DialogTheme(
      backgroundColor: Color(0xFFFEFFFE),
    ),
    accentTextTheme: const TextTheme(
      headline1: TextStyle(color: Color(0xFFab3cc9)),
      headline2: TextStyle(color: Color(0xFFc790de)),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      showSelectedLabels: false,
      showUnselectedLabels: true,
      backgroundColor: Color(0xFFE0E1E0),
    ),
    inputDecorationTheme: InputDecorationTheme(
        fillColor: const Color(0xFFF3F4F3),
        focusColor: Colors.purple[400],
        contentPadding:
            const EdgeInsets.symmetric(vertical: 16.0, horizontal: 10.0),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.purple[400]!,
          ),
          borderRadius: BorderRadius.circular(25.0),
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.transparent,
            ),
            borderRadius: BorderRadius.circular(25.0)),
        border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.transparent,
            ),
            borderRadius: BorderRadius.circular(25.0))),
    bottomAppBarColor: const Color(0xFFE0E1E0),
    popupMenuTheme: const PopupMenuThemeData(
      color: Color(0xFFE9EAE9),
    ),
    bottomSheetTheme:
        const BottomSheetThemeData(modalBackgroundColor: Color(0xFFF3F4F3)),
    navigationBarTheme: NavigationBarThemeData(
        backgroundColor: const Color(0xFFE0E1E0),
        indicatorColor: Colors.purple[400]!,
        iconTheme: MaterialStateProperty.all(const IconThemeData(
          color: Color(0xFF050505),
        )),
        labelTextStyle: MaterialStateProperty.all(const TextStyle(
            color: Color(0xFF050505), fontWeight: FontWeight.w500))));

//ESCURO
ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    primaryColorBrightness: Brightness.light,
    primaryColor: const Color(0xFF202124),
    accentColor: const Color(0xFFB17FBF),
    scaffoldBackgroundColor: const Color(0xFF202124),
    colorScheme: const ColorScheme.dark(
      primary:  Color(0xFFB17FBF),
      primaryVariant:  Color(0xFFB17FBF),
      onSecondary: Color(0xFFCACACA),
      secondary: Color(0xFFB17FBF),
    ),
    cardTheme: const CardTheme(
      color: Color(0xFF303134),
    ),
    appBarTheme: const AppBarTheme(
        color: Color(0xFF202124),
        elevation: 0,
        iconTheme: IconThemeData(color: Color(0xFFCACACA)),
        titleTextStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Color(0xFFFFFFFF))),
    dialogTheme: const DialogTheme(
      backgroundColor: Color(0xFF292929),
    ),
    popupMenuTheme: const PopupMenuThemeData(
      color: Color(0xFF2D2D2D),
    ),
    accentTextTheme: const TextTheme(
      headline1: TextStyle(color: Color(0xFFc9a5d4)),
      headline2: TextStyle(color: Color(0xFF5c4a61)),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      showSelectedLabels: true,
      showUnselectedLabels: true,
      backgroundColor: Color(0xFF141518),
    ),
    inputDecorationTheme: InputDecorationTheme(
        fillColor: const Color(0xFF2B2C2F),
        focusColor: const Color(0xFFB17FBF),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 16.0, horizontal: 10.0),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xFFB17FBF),
          ),
          borderRadius: BorderRadius.circular(25.0),
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.transparent,
            ),
            borderRadius: BorderRadius.circular(25.0)),
        border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.transparent,
            ),
            borderRadius: BorderRadius.circular(25.0))),
    bottomAppBarColor: const Color(0xFF141518),
    bottomSheetTheme:
        const BottomSheetThemeData(modalBackgroundColor: Color(0xFF202124)),
    navigationBarTheme: NavigationBarThemeData(
        backgroundColor: const Color(0xFF141518),
        indicatorColor: const Color(0xFFB17FBF),
        iconTheme: MaterialStateProperty.all(const IconThemeData(
          color: Color(0xFFCACACA),
        )),
        labelTextStyle: MaterialStateProperty.all(const TextStyle(
            color: Color(0xFFCACACA), fontWeight: FontWeight.w500))));

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
