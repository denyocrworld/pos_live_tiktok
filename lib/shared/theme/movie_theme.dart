import 'package:flutter/material.dart';

const themeRadius = 16.0;
const themeWarningColor = Color(0xffd59c05);
const themeScaffoldBackgroundColor = Color(0xff10111a);

getMovieThemeData() {
  return ThemeData.dark().copyWith(
    scaffoldBackgroundColor: themeScaffoldBackgroundColor,
    appBarTheme: const AppBarTheme(
      elevation: 0.0,
      backgroundColor: Colors.transparent,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xffca3934),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(themeRadius),
        ),
      ),
    ),
    cardTheme: CardTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(themeRadius),
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.black,
      selectedItemColor: Colors.yellow,
      unselectedItemColor: Colors.grey,
    ),
  );
}
