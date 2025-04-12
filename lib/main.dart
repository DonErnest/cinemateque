import 'package:cinemateque/theme/dark_theme.dart';
import 'package:cinemateque/theme/light_theme.dart';
import 'package:flutter/material.dart';

import 'cinemateque.dart';

void main() {
  runApp(
    MaterialApp(
      home: Cinemateque(),
      theme: lightTheme,
      darkTheme: darkTheme,
      title: "Cinemateque",
    ),
  );
}
