import 'package:cinemateque/providers/cinemateque_state.dart';
import 'package:cinemateque/screens/details.dart';
import 'package:cinemateque/theme/dark_theme.dart';
import 'package:cinemateque/theme/light_theme.dart';
import 'package:flutter/material.dart';

import 'app_routes.dart';
import 'cinemateque.dart';

void main() {
  runApp(
    CinematequeState(
      child: MaterialApp(
        initialRoute: AppRoutes.home,
        routes: {
          AppRoutes.home: (ctx) => Cinemateque(),
          AppRoutes.movie: (ctx) => MovieDetails(),
        },
        theme: lightTheme,
        darkTheme: darkTheme,
        title: "Cinemateque",
      ),
    ),
  );
}
