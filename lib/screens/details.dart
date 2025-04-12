import 'package:cinemateque/models/cinema.dart';
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
  Set<int> _bookRatingButtonSelection = <int>{};

  void markMovieAsWatched(BuildContext ctx) async {
    if (!widget.movie.watched) {
      return showDialog<void>(
        context: ctx,
        builder:
            (ctx) => StatefulBuilder(
              builder:
                  (ctx, setState) => AlertDialog(
                    title: Text("Please, rate the movie"),
                    content: SegmentedButton<int>(
                      segments:
                          [1, 2, 3, 4, 5]
                              .map<ButtonSegment<int>>(
                                (value) => ButtonSegment(
                                  value: value,
                                  label: Text(value.toString()),
                                ),
                              )
                              .toList(),
                      selected: _bookRatingButtonSelection,
                      multiSelectionEnabled: false,
                      emptySelectionAllowed: true,
                      onSelectionChanged: (newSelection) {
                        setState(() {
                          _bookRatingButtonSelection = newSelection;
                        });
                      },
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(ctx).pop();
                        },
                        child: Text("cancel"),
                      ),
                      TextButton(
                        onPressed: () {
                          if (_bookRatingButtonSelection.isNotEmpty) {
                            widget.updateRating(
                              widget.movie.id,
                              _bookRatingButtonSelection.first,
                              !widget.movie.watched,
                            );
                            Navigator.of(ctx).pop();
                          }
                        },
                        child: Text("Rate"),
                      ),
                    ],
                  ),
            ),
      );
    } else {
      setState(() {
        widget.updateRating(
          widget.movie.id,
          null,
          false,
        );
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
