import 'package:cinemateque/models/cinema.dart';
import 'package:cinemateque/widgets/rating_buttons.dart';
import 'package:flutter/material.dart';
import 'package:validators/validators.dart';

class AddMovieForm extends StatefulWidget {
  final void Function(Movie movie) saveMovie;

  const AddMovieForm({super.key, required this.saveMovie});

  @override
  State<AddMovieForm> createState() => _AddMovieFormState();
}

class _AddMovieFormState extends State<AddMovieForm> {
  var insertedName = "";
  var insertedPoster = "";
  var insertedDescription = "";
  var insertedYear = "";

  final nameController = TextEditingController();
  final posterController = TextEditingController();
  final descriptionController = TextEditingController();
  final yearController = TextEditingController();

  Set<int> movieRatingButtonSelection = <int>{};

  void onCanceled() {
    Navigator.pop(context);
  }

  @override
  void dispose() {
    nameController.dispose();
    posterController.dispose();
    descriptionController.dispose();
    yearController.dispose();
    super.dispose();
  }

  void saveMovieData() {
    if (insertedPoster != "" &&
        isURL(insertedPoster) &&
        insertedName != "" &&
        insertedDescription != "" &&
        insertedYear != "") {
      setState(() {
        final newMovie = Movie(
          poster: insertedPoster,
          name: insertedName,
          description: insertedDescription,
          year: int.parse(insertedYear),
          watched: movieRatingButtonSelection.isNotEmpty? true: false,
          rating: movieRatingButtonSelection.isNotEmpty? movieRatingButtonSelection.first: null,
        );
        widget.saveMovie(newMovie);
        Navigator.pop(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(16, 16, 16, bottomInset + 16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: nameController,
                    maxLength: 25,
                    onChanged:
                        (value) => setState(() {
                          insertedName = value;
                        }),
                    decoration: const InputDecoration(label: Text("Movie name")),
                  ),
                ),
                Expanded(
                  child: TextField(
                    controller: yearController,
                    keyboardType: TextInputType.number,
                    onChanged:
                        (value) => setState(() {
                          insertedYear = value;
                        }),
                    decoration: const InputDecoration(label: Text("year")),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: posterController,
                    onChanged:
                        (value) => setState(() {
                          insertedPoster = value;
                        }),
                    decoration: const InputDecoration(
                      label: Text("Poster URL"),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: descriptionController,
                    onChanged:
                        (value) => setState(() {
                          insertedDescription = value;
                        }),
                    maxLength: 300,
                    maxLines: 5,
                    decoration: const InputDecoration(
                      label: Text("movie description"),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: SegmentedButton<int>(
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
                ),
              ],
            ),
            Row(
              children: [
                TextButton(onPressed: onCanceled, child: Text('Cancel')),
                const Spacer(),
                ElevatedButton(
                  onPressed: saveMovieData,
                  child: const Text("Save"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
