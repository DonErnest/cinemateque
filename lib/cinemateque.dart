import 'package:cinemateque/models/cinema.dart';
import 'package:cinemateque/screens/home.dart';
import 'package:flutter/material.dart';

class Cinemateque extends StatefulWidget {
  const Cinemateque({super.key});

  @override
  State<Cinemateque> createState() => _CinematequeState();
}

class _CinematequeState extends State<Cinemateque> {
  List<Movie> movies = sampledMovies;

  @override
  Widget build(BuildContext context) {
    return Home(movies: movies);
  }
}
