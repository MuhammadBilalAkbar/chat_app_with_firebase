import 'package:flutter/material.dart';

import 'constants.dart';

final theme = ThemeData(
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 20),
      minimumSize: const Size.fromHeight(52),
      backgroundColor: mainColor,
    ),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0,
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 35,
      fontWeight: FontWeight.bold,
    ),
  ),
);
