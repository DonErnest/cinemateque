import 'package:cinemateque/models/cinema.dart';
import 'package:flutter/material.dart';

class MovieTile extends StatelessWidget {
  final Movie movie;

  const MovieTile({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    print("${movie.rating} ${movie.name}");
    return Padding(
      padding: const EdgeInsets.all(10.0),
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
          child: Text(
            movie.name,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.amberAccent,
          ),
        ),
        child: Image.network(movie.poster),
      ),
    );
  }
}
