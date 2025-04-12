import 'package:cinemateque/models/cinema.dart';
import 'package:cinemateque/widgets/canvas.dart';
import 'package:flutter/material.dart';

import '../widgets/movie_tile.dart';

class Home extends StatefulWidget {
  final List<Movie> movies;

  const Home({super.key, required this.movies});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentScreenIndex = 0;
  late List<Movie> selectedMovies;

  List<Movie> getMovies(int index) {
    if (currentScreenIndex == 0) {
      return widget.movies.where((movie) => !movie.watched).toList();
    } else {
      return widget.movies.where((movie) => movie.watched).toList();
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

  @override
  Widget build(BuildContext context) {
    return ScreenCanvas(
      appBarActions: [],
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
                (ctx, idx) => MovieTile(movie: selectedMovies[idx]),
          ),
        ),
      ],
    );
  }
}
