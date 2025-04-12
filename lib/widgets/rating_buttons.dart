import 'package:flutter/material.dart';

List<ButtonSegment<int>> get ratingOptions {
  return [1, 2, 3, 4, 5]
      .map<ButtonSegment<int>>(
        (value) => ButtonSegment(value: value, label: Text(value.toString())),
      )
      .toList();
}
