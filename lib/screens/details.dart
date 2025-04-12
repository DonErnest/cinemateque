import 'package:cinemateque/models/cinema.dart';
import 'package:cinemateque/widgets/canvas.dart';
import 'package:flutter/material.dart';

class MovieDetails extends StatelessWidget {
  final Movie movie;

  const MovieDetails({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return ScreenCanvas(
      widgets: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.network(movie.poster),
                Divider(thickness: 3.0),
                Text(
                  movie.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(height: 20),
                Text(movie.description),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
