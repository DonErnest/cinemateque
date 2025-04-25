import 'package:cinemateque/app_routes.dart';
import 'package:cinemateque/models/cinema.dart';
import 'package:cinemateque/providers/cinemateque_provider.dart';
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
  late CinematequeProvider movieProvider;

  int currentScreenIndex = 0;
  late List<Movie> selectedMovies;

  List<Movie> getMovies(int index) {
    if (currentScreenIndex == 0) {
      return movieProvider.newMovies;
    } else {
      return movieProvider.watchedMovies;
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    movieProvider = CinematequeProvider.of(context)!;
    selectedMovies = getMovies(currentScreenIndex);
  }

  void updateCurrentPageIndex(int newIndex) {
    setState(() {
      currentScreenIndex = newIndex;
      selectedMovies = getMovies(newIndex);
    });
  }

  void showMovieDetails(String id) {
    Navigator.of(context).pushNamed(AppRoutes.movie, arguments: id);
  }

  void openAddMovieSheet() {
    showModalBottomSheet(
      context: context,
      useSafeArea: true,
      isScrollControlled: true,
      builder:
          (ctx) =>
          Wrap(children: [AddMovieForm(saveMovie: movieProvider.addNewMovie)]),
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
