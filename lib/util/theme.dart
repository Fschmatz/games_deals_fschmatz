import 'package:flutter/material.dart';

ThemeData light = ThemeData(
    useMaterial3: true,
    textTheme: const TextTheme(
      titleMedium: TextStyle(fontWeight: FontWeight.w400),
    ),
    brightness: Brightness.light,
    primaryColor: const Color(0xFFFFFBFE),
    scaffoldBackgroundColor: const Color(0xFFFFFBFE),
    colorScheme: ColorScheme.light(
      primary: Colors.purple.shade400,
      onSecondary: const Color(0xFF050505),
      secondary: Colors.purple.shade400,
    ),
    appBarTheme: const AppBarTheme(
      surfaceTintColor: Color(0xFFFFFBFE),
      color: Color(0xFFFFFBFE),
    ),
    listTileTheme: ListTileThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        iconColor: const Color(0xFF454546)),
    cardTheme: const CardTheme(
      surfaceTintColor: Color(0xFFF3EDF7),
      color: Color(0xFFF3EDF7),
    ),
    dialogTheme: const DialogTheme(
      surfaceTintColor: Color(0xFFFFFBFE),
      backgroundColor: Color(0xFFFFFBFE),
    ),
    inputDecorationTheme: InputDecorationTheme(
        fillColor: const Color(0xFFF4F0F4),
        focusColor: Colors.purple.shade300,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.purple.shade300,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
        )),
    popupMenuTheme: const PopupMenuThemeData(
      color: Color(0xFFE9E5E9),
    ),
    bottomSheetTheme:
        const BottomSheetThemeData(modalBackgroundColor: Color(0xFFF4F0F4)),
    navigationBarTheme: NavigationBarThemeData(
        backgroundColor: const Color(0xFFFFFBFE),
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
    primaryColor: const Color(0xFF1C1B1E),
    scaffoldBackgroundColor: const Color(0xFF1C1B1E),
    colorScheme: const ColorScheme.dark(
      primary: Color(0xFFEFADFC),
      onPrimary: Color(0xFF4D155F),
      onSecondary: Color(0xFFCACACA),
      secondary: Color(0xFFEFADFC),
    ),
    cardTheme: const CardTheme(
      surfaceTintColor: Color(0xFF2C272E),
      color: Color(0xFF2C272E),
    ),
    appBarTheme: const AppBarTheme(
      surfaceTintColor: Color(0xFF1C1B1E),
      color: Color(0xFF1C1B1E),
    ),
    dialogTheme: const DialogTheme(
      surfaceTintColor: Color(0xFF29282A),
      backgroundColor: Color(0xFF29282A),
    ),
    popupMenuTheme: const PopupMenuThemeData(
      color: Color(0xFF29282A),
    ),
    listTileTheme: ListTileThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        iconColor: const Color(0xFFE2E2E9)),
    inputDecorationTheme: const InputDecorationTheme(
        fillColor: Color(0xFF29282A),
        focusColor: Color(0xFFEFADFC),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFFEFADFC),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
        )),
    bottomSheetTheme:
        const BottomSheetThemeData(modalBackgroundColor: Color(0xFF1C1B1E)),
    navigationBarTheme: NavigationBarThemeData(
        backgroundColor: const Color(0xFF1C1B1E),
        indicatorColor: const Color(0xFF672f77),
        iconTheme: MaterialStateProperty.all(const IconThemeData(
          color: Color(0xffeeebee),
        )),
        labelTextStyle: MaterialStateProperty.all(const TextStyle(
            color: Color(0xffeeebee), fontWeight: FontWeight.w500))));
