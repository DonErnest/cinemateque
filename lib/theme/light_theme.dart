import 'package:flutter/material.dart';

import 'custom_colors.dart';

final lightColorScheme = ColorScheme.fromSeed(
  seedColor: Color.fromRGBO(20, 20, 20, 1),
  dynamicSchemeVariant: DynamicSchemeVariant.expressive,
);
final lightTheme = ThemeData.light().copyWith(
  colorScheme: lightColorScheme,
  appBarTheme: AppBarTheme().copyWith(
    foregroundColor: lightColorScheme.onPrimaryContainer,
    titleTextStyle: TextStyle(color: lightColorScheme.onPrimaryContainer),
    toolbarTextStyle: TextStyle(color: lightColorScheme.onPrimaryContainer),
    actionsIconTheme: IconThemeData(color: lightColorScheme.onPrimaryContainer),
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
  iconTheme: IconThemeData(color: Colors.purpleAccent.shade700),
  inputDecorationTheme: InputDecorationTheme(
    labelStyle: TextStyle(color: Colors.black),
  ),
  extensions: [movieLabelBoxColors],
);

final movieLabelBoxColors = CustomColors(
  movieLabelBox: Color.fromRGBO(217, 3, 104, 1),
  movieLabelBoxText: Colors.white,
);
