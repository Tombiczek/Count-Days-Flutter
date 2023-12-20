import 'package:flutter/material.dart';

class AppThemes {
 static final lightTheme = ThemeData(
    primaryColor: const Color.fromARGB(255, 255, 255, 255),
    scaffoldBackgroundColor: const Color.fromARGB(255, 242, 242, 247),
    textTheme: _buildTextTheme(Colors.black),
    cardColor: const Color.fromARGB(255, 0, 0, 0), //text color
    focusColor: const Color.fromARGB(255, 242, 242, 247),  // color of bottom sheet pop up
    canvasColor: const Color.fromARGB(255, 255, 255, 255), // text window
    brightness: Brightness.light,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    hoverColor: Colors.transparent,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color.fromARGB(255, 242, 242, 247)
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color.fromARGB(255, 242, 242, 247), 
      shadowColor: Colors.transparent,
      titleTextStyle: TextStyle(
        color: Colors.black, 
        fontSize: 17, 
        fontWeight: FontWeight.bold),
        elevation: 0
      ),
    dividerTheme: const DividerThemeData(
      color: Color.fromARGB(255, 203, 203, 205)
      ),
    );

  static final darkTheme = ThemeData(
    primaryColor: const Color.fromARGB(255, 28, 28, 31),
    scaffoldBackgroundColor: const Color.fromARGB(255, 0, 0, 0),
    textTheme: _buildTextTheme(Colors.white),
    cardColor: const Color.fromARGB(255, 255, 255, 255),
    focusColor: const Color.fromARGB(255, 28, 28, 30),
    canvasColor:const Color.fromARGB(255, 44, 44, 46),
    brightness: Brightness.dark,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    hoverColor: Colors.transparent,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color.fromARGB(255, 0, 0, 0)
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      shadowColor: Colors.transparent,
      titleTextStyle: TextStyle(
        color: Colors.white, 
        fontSize: 17, 
        fontWeight: FontWeight.bold)
      ),
    dividerTheme: const DividerThemeData(
      color: Color.fromARGB(255, 48, 48, 51)
      ),
  );

  static TextTheme _buildTextTheme(Color textColor) {
    return TextTheme(
      bodySmall: TextStyle(
        color: textColor,
        fontSize: 15
      ),
    );
  }
}