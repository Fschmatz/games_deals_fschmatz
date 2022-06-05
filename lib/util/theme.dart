import 'package:flutter/material.dart';

ThemeData light = ThemeData(
    useMaterial3: true,
    textTheme: const TextTheme(
      titleMedium: TextStyle(fontWeight: FontWeight.w400),
    ),
    brightness: Brightness.light,
    primaryColor: const Color(0xFFFFFBFF),
    scaffoldBackgroundColor: const Color(0xFFFFFBFF),
    colorScheme: ColorScheme.light(
      primary:  Colors.purple.shade400,
      onSecondary: const Color(0xFF050505),
      secondary: Colors.purple.shade400,
    ),
    appBarTheme: const AppBarTheme(
        surfaceTintColor: Color(0xFFFFFBFF),
        color: Color(0xFFFFFBFF),
      ),
    cardTheme: const CardTheme(
      color: Color(0xFFF4F0F4),
    ),
    dialogTheme: const DialogTheme(
      backgroundColor: Color(0xFFFFFBFF),
    ),
    inputDecorationTheme: InputDecorationTheme(
        fillColor: const Color(0xFFF4F0F4),
        focusColor: Colors.purple.shade300,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 16.0, horizontal: 10.0),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.purple.shade300,
          ),
          borderRadius: BorderRadius.circular(12.0),
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.transparent,
            ),
            borderRadius: BorderRadius.circular(12.0)),
        border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.transparent,
            ),
            borderRadius: BorderRadius.circular(12.0))),
    bottomAppBarColor: const Color(0xFFF4F0F4),
    popupMenuTheme: const PopupMenuThemeData(
      color: Color(0xFFE9E5E9),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      showSelectedLabels: false,
      showUnselectedLabels: true,
      backgroundColor: Color(0xFFF4F0F4),
    ),
    bottomSheetTheme:
        const BottomSheetThemeData(modalBackgroundColor: Color(0xFFF4F0F4)),
    navigationBarTheme: NavigationBarThemeData(
        backgroundColor: const Color(0xFFF4F0F4),
        indicatorColor: Colors.purple.shade300,
        iconTheme: MaterialStateProperty.all(const IconThemeData(
          color: Color(0xFF050505),
        )),
        labelTextStyle: MaterialStateProperty.all(const TextStyle(
            color: Color(0xFF050505), fontWeight: FontWeight.w500))));


ThemeData dark = ThemeData(
    useMaterial3: true,
    textTheme: const TextTheme(
      titleMedium: TextStyle(fontWeight: FontWeight.w400),
    ),
    brightness: Brightness.dark,
    primaryColor: const Color(0xFF212022),
    scaffoldBackgroundColor: const Color(0xFF212022),
    colorScheme: const ColorScheme.dark(
      primary:  Color(0xFFEFADFC),
      onPrimary: Color(0xFF4D155F),
      onSecondary: Color(0xFFCACACA),
      secondary: Color(0xFFEFADFC),
    ),
    cardTheme: const CardTheme(
      color: Color(0xFF313032),
    ),
    appBarTheme: const AppBarTheme(
        surfaceTintColor: Color(0xFF212022),
        color: Color(0xFF212022),
    ),
    dialogTheme: const DialogTheme(
      backgroundColor: Color(0xFF29282A),
    ),
    popupMenuTheme: const PopupMenuThemeData(
      color: Color(0xFF29282A),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      showSelectedLabels: true,
      showUnselectedLabels: true,
      backgroundColor: Color(0xFF29282A),
    ),
    inputDecorationTheme: InputDecorationTheme(
        fillColor: const Color(0xFF29282A),
        focusColor: const Color(0xFFEFADFC),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 16.0, horizontal: 10.0),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xFFEFADFC),
          ),
          borderRadius: BorderRadius.circular(12.0),
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.transparent,
            ),
            borderRadius: BorderRadius.circular(12.0)),
        border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.transparent,
            ),
            borderRadius: BorderRadius.circular(12.0))),
    bottomAppBarColor: const Color(0xFF29282A),
    bottomSheetTheme:
        const BottomSheetThemeData(modalBackgroundColor: Color(0xFF212022)),
    navigationBarTheme: NavigationBarThemeData(
        backgroundColor: const Color(0xFF29282A),
        indicatorColor: const Color(0xFF672f77),
        iconTheme: MaterialStateProperty.all(const IconThemeData(
          color: Color(0xffeeebee),
        )),
        labelTextStyle: MaterialStateProperty.all(const TextStyle(
            color: Color(0xffeeebee), fontWeight: FontWeight.w500))));
