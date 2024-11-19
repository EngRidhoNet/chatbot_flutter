import 'package:flutter/material.dart';

class AppTheme {
  static final light = ThemeData(
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.blue,
      elevation: 0,
      centerTitle: true,
    ),
  );

  static final dark = ThemeData(
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: Colors.grey[900],
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.grey[850],
      elevation: 0,
      centerTitle: true,
    ),
  );
}
