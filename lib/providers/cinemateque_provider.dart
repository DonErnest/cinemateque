import 'package:cinemateque/models/cinema.dart';
import 'package:flutter/cupertino.dart';

class CinematequeProvider extends InheritedWidget {
  final List<Movie> movies;

  final void Function(String movieId, int? rating, bool watched) rateMovie;
  final void Function(Movie movie) addNewMovie;


  const CinematequeProvider({
    super.key,
    required super.child,
    required this.movies,
    required this.rateMovie,
    required this.addNewMovie,
  });

  List<Movie> get watchedMovies{
    return movies.where((movie) => movie.watched).toList();
  }

  List<Movie> get newMovies{
    return movies.where((movie) => !movie.watched).toList();
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }

  static CinematequeProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CinematequeProvider>();
  }
}
