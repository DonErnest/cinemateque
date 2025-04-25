import 'package:cinemateque/models/cinema.dart';
import 'package:cinemateque/providers/cinemateque_provider.dart';
import 'package:flutter/material.dart';


class CinematequeState extends StatefulWidget {
  final Widget child;

  const CinematequeState({super.key, required this.child});

  @override
  State<CinematequeState> createState() => _CinematequeStateState();
}

class _CinematequeStateState extends State<CinematequeState> {
  List<Movie> movies = sampledMovies;

  void addNewTask(Movie movie) {
    setState(() {
      movies.add(movie);
    });
  }

  void updateMovieRating(String movieId, int? rating, bool watched) {
    setState(() {
      final movieIdx = movies.indexWhere((movie) => movie.id == movieId);
      movies[movieIdx].rating = rating;
      movies[movieIdx].watched = watched;
    });
  }


  @override
  Widget build(BuildContext context) {
    return CinematequeProvider(
      movies: movies,
      rateMovie: updateMovieRating,
      addNewMovie: addNewTask,
      child: widget.child,
    );
  }
}
