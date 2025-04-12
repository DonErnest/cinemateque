import 'package:flutter/material.dart';

import 'custom_colors.dart';


final darkColorScheme = ColorScheme.fromSeed(
  seedColor: Color.fromRGBO(20,20,20, 1),
  dynamicSchemeVariant: DynamicSchemeVariant.expressive,
  brightness: Brightness.dark,
);
final darkTheme = ThemeData.dark().copyWith(
    colorScheme: darkColorScheme,
    appBarTheme: AppBarTheme().copyWith(
      foregroundColor: darkColorScheme.onPrimaryContainer,
      titleTextStyle: TextStyle(
          color: darkColorScheme.onPrimaryContainer
      ),
      toolbarTextStyle: TextStyle(color: darkColorScheme.onPrimaryContainer),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.purpleAccent.shade700,
        foregroundColor: Colors.white,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        backgroundColor: Colors.purpleAccent.shade700,
        foregroundColor: Colors.white,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
        labelStyle: TextStyle(color: Color.fromRGBO(241, 233, 218, 1))
    ),
    iconTheme: IconThemeData(
      color: Colors.white
    ),
    extensions: [movieLabelBoxColors]
);

final movieLabelBoxColors = CustomColors(
  movieLabelBox: Color.fromRGBO(217, 3, 104, 1),
  movieLabelBoxText: Colors.white,
);