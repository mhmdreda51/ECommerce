import 'package:e_commerce/constants.dart';
import 'package:flutter/material.dart';

class Themes {
  final lightTheme = ThemeData.light().copyWith(
      primaryColor: Colors.blueGrey[300],
      textTheme: TextTheme(
        headline1: TextStyle(
          color: Colors.black,
          fontFamily: 'SourceSans',
        ),
      ),
      appBarTheme: AppBarTheme(
        brightness: Brightness.light,
        textTheme: TextTheme(
          headline1: TextStyle(color: Colors.black),
        ),
      ),
      buttonColor: primaryColor);
  final darkTheme = ThemeData.dark().copyWith(
      primaryColor: Colors.blueGrey[800],
      textTheme: TextTheme(
        headline2: TextStyle(
          color: Colors.white,
          fontFamily: 'SourceSans',
        ),
        headline1: TextStyle(
          color: Colors.white,
          fontFamily: 'SourceSans',
        ),
      ),
      appBarTheme: AppBarTheme(
        brightness: Brightness.dark,
        textTheme: TextTheme(
          headline1: TextStyle(color: Colors.white),
        ),
      ),
      buttonColor: primaryColor);
}
