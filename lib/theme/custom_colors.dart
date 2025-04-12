import 'package:flutter/material.dart';

class CustomColors extends ThemeExtension<CustomColors> {
  final Color movieLabelBox;
  final Color movieLabelBoxText;

  const CustomColors({
    required this.movieLabelBox,
    required this.movieLabelBoxText,
  });

  @override
  ThemeExtension<CustomColors> copyWith() {
    return CustomColors(
      movieLabelBox: movieLabelBox ?? this.movieLabelBox,
      movieLabelBoxText: movieLabelBoxText ?? this.movieLabelBoxText,
    );
  }

  @override
  ThemeExtension<CustomColors> lerp(
      covariant ThemeExtension<CustomColors>? other, double t) {
    if (other is! CustomColors) return this;
    return CustomColors(
      movieLabelBox: movieLabelBox,
      movieLabelBoxText: movieLabelBoxText,
    );
  }
}