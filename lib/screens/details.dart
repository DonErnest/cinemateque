import 'package:cinemateque/models/cinema.dart';
import 'package:cinemateque/widgets/alert_rating_dialog.dart';
import 'package:cinemateque/widgets/canvas.dart';
import 'package:flutter/material.dart';

class MovieDetails extends StatefulWidget {
  final Movie movie;
  final void Function(String id, int? rating, bool watched) updateRating;

  const MovieDetails({
    super.key,
    required this.movie,
    required this.updateRating,
  });

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {

  void ratingUpdated(String id, int? rating, bool watched) {
    setState(() {
      widget.updateRating(id, rating, watched);
    });
  }
  
  void markMovieAsWatched(BuildContext ctx) async {
    if (!widget.movie.watched) {
      return showDialog<void>(
        context: ctx,
        builder:
            (ctx) =>
            AlertRatingDialog(
              movie: widget.movie,
              onSave: ratingUpdated,
            ),
      );
    } else {
      setState(() {
        widget.updateRating(widget.movie.id, null, false);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScreenCanvas(
      widgets: [
        Expanded(
          child: Column(
            children: [
              Image.network(widget.movie.poster),
              Divider(thickness: 3.0),
              Text(
                widget.movie.name,
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(height: 20),
              Text(widget.movie.description),
              Spacer(),
              ElevatedButton(
                onPressed: () {
                  markMovieAsWatched(context);
                },
                child: Text(
                  widget.movie.watched
                      ? "Return to 'To be seen'"
                      : "Mark as watched",
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
