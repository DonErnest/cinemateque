import 'package:cinemateque/models/cinema.dart';
import 'package:flutter/material.dart';

class MovieTile extends StatelessWidget {
  final Movie movie;
  final void Function(String id) onMovieClicked;
  const MovieTile({super.key, required this.movie, required this.onMovieClicked});

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkResponse(
        onTap: () => {onMovieClicked(movie.id)},
        child: GridTile(
          header:
              movie.watched
                  ? Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: double.minPositive,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.redAccent,
                        border: Border.all(color: Colors.black, width: 2.0),
                        boxShadow: [BoxShadow(spreadRadius: 0.5)],
                      ),
                      constraints: BoxConstraints(
                        minWidth: 40, // Minimum width
                        minHeight:
                            40, // Minimum height (same as width for circle)
                      ),
                      child: Center(
                        child: Text(
                          movie.rating!.toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ),
                  )
                  : null,
          footer: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.amberAccent,
            ),
            child: Text(
              movie.name,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          child: Image.network(movie.poster),
        ),
      ),
    );
  }
}
