import 'package:cinemateque/models/cinema.dart';
import 'package:cinemateque/widgets/rating_buttons.dart';
import 'package:flutter/material.dart';

class AlertRatingDialog extends StatefulWidget {
  final Movie movie;
  final void Function(String id, int? rating, bool watched) onSave;

  const AlertRatingDialog({super.key, required this.movie, required this.onSave});

  @override
  State<AlertRatingDialog> createState() => _AlertRatingDialogState();
}

class _AlertRatingDialogState extends State<AlertRatingDialog> {
  Set<int> movieRatingButtonSelection = <int>{};

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Please, rate the movie"),
      content: SegmentedButton<int>(
        segments: ratingOptions,
        selected: movieRatingButtonSelection,
        multiSelectionEnabled: false,
        emptySelectionAllowed: true,
        onSelectionChanged: (newSelection) {
          setState(() {
            movieRatingButtonSelection = newSelection;
          });
        },
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text("cancel"),
        ),
        TextButton(
          onPressed: () {
            if (movieRatingButtonSelection.isNotEmpty) {
              widget.onSave(
                widget.movie.id,
                movieRatingButtonSelection.first,
                !widget.movie.watched,
              );
              Navigator.of(context).pop();
            }
          },
          child: Text("Rate"),
        ),
      ],
    );
  }
}
