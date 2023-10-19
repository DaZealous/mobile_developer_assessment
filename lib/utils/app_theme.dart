import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme (){
    return ThemeData.light().copyWith(
        appBarTheme: const AppBarTheme(
        backgroundColor: Colors.blue
        )
    );
  }

  static ThemeData darkTheme (){
    return ThemeData.dark().copyWith(
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.blue
      )
    );
  }
}