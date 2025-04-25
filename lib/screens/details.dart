import 'package:cinemateque/models/cinema.dart';
import 'package:cinemateque/providers/cinemateque_provider.dart';
import 'package:cinemateque/widgets/alert_rating_dialog.dart';
import 'package:cinemateque/widgets/canvas.dart';
import 'package:flutter/material.dart';

class MovieDetails extends StatefulWidget {
  const MovieDetails({
    super.key,
  });

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  late Movie movie;
  late CinematequeProvider movieProvider;

  var descriptionScrollController = ScrollController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    movieProvider = CinematequeProvider.of(context)!;
    final movieId = ModalRoute.of(context)!.settings.arguments as String;
    movie = movieProvider.movies.firstWhere((movie) => movie.id == movieId);
  }

  void markMovieAsWatched(BuildContext ctx) async {
    if (!movie.watched) {
      return showDialog<void>(
        context: ctx,
        builder:
            (ctx) =>
            AlertRatingDialog(
              movie: movie,
              onSave: movieProvider.rateMovie,
            ),
      );
    } else {
      setState(() {
        movieProvider.rateMovie(movie.id, null, false);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).textTheme;
    return ScreenCanvas(
      widgets: [
        Expanded(
          child: Column(
            children: [
              Image.network(movie.poster),
              Divider(thickness: 3.0),
              SizedBox(height: 20),
              Text(
                movie.name,
                textAlign: TextAlign.center,
                style: theme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                "(${movie.year})",
                textAlign: TextAlign.center,
                style: theme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Expanded(
                child: SingleChildScrollView(
                  controller: descriptionScrollController,
                  child: Text(
                      movie.description,
                      style: theme.bodyLarge,
                  ),
                ),
              ),
              Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    markMovieAsWatched(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 0),
                    child: Text(
                      movie.watched
                          ? "To be seen"
                          : "Watched",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
