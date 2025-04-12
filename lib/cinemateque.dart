import 'package:cinemateque/models/cinema.dart';
import 'package:cinemateque/widgets/canvas.dart';
import 'package:flutter/material.dart';

import 'screens/add_form.dart';
import 'screens/details.dart';
import 'widgets/movie_tile.dart';


class Cinemateque extends StatefulWidget {
  const Cinemateque({
    super.key,
  });

  @override
  State<Cinemateque> createState() => _CinematequeState();
}

class _CinematequeState extends State<Cinemateque> {
  List<Movie> movies = sampledMovies;

  void updateMoviesList(Movie newMovie) {
    setState(() {
      movies.add(newMovie);
      selectedMovies = getMovies(currentScreenIndex);
    });
  }

  void updateMovieRating(String movieId, int? rating, bool watched) {
    setState(() {
      final movieIdx = movies.indexWhere((movie) => movie.id == movieId);
      movies[movieIdx].rating = rating;
      movies[movieIdx].watched = watched;
      selectedMovies = getMovies(currentScreenIndex);
    });
  }

  int currentScreenIndex = 0;
  late List<Movie> selectedMovies;

  List<Movie> getMovies(int index) {
    if (currentScreenIndex == 0) {
      return movies.where((movie) => !movie.watched).toList();
    } else {
      return movies.where((movie) => movie.watched).toList();
    }
  }

  @override
  void initState() {
    selectedMovies = getMovies(currentScreenIndex);
    super.initState();
  }

  void updateCurrentPageIndex(int newIndex) {
    setState(() {
      currentScreenIndex = newIndex;
      selectedMovies = getMovies(newIndex);
    });
  }

  void showMovieDetails(String id) {
    var movie = selectedMovies.firstWhere((movie) => movie.id == id);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (ctx) =>
            MovieDetails(movie: movie, updateRating: updateMovieRating),
      ),
    );
  }

  void openAddMovieSheet() {
    showModalBottomSheet(
      context: context,
      useSafeArea: true,
      isScrollControlled: true,
      builder:
          (ctx) =>
          Wrap(children: [AddMovieForm(saveMovie: updateMoviesList)]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScreenCanvas(
      appBarActions: [
        IconButton(onPressed: openAddMovieSheet, icon: Icon(Icons.add)),
      ],
      bottomBar: NavigationBar(
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.movie_creation_outlined),
            label: "To be seen",
            selectedIcon: Icon(Icons.movie_creation),
          ),
          NavigationDestination(
            icon: Icon(Icons.star_outline_sharp),
            label: "Watched",
            selectedIcon: Icon(Icons.star_outlined),
          ),
        ],
        selectedIndex: currentScreenIndex,
        onDestinationSelected: updateCurrentPageIndex,
      ),
      widgets: [
        Expanded(
          child: GridView.builder(
            itemCount: selectedMovies.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemBuilder:
                (ctx, idx) => MovieTile(
              movie: selectedMovies[idx],
              onMovieClicked: showMovieDetails,
            ),
          ),
        ),
      ],
    );
  }
}
