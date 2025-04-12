import 'package:cinemateque/models/cinema.dart';
import 'package:flutter/material.dart';

class MovieTile extends StatelessWidget {
  final Movie movie;

  const MovieTile({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GridTile(
        footer: Text(movie.name),
        child: Image.network(movie.poster),
      ),
    );
  }
}
