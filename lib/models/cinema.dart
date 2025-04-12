import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Movie {
  late final String id;
  final String poster;
  final String name;
  final String description;
  final int year;
  bool watched;
  int? rating;

  Movie({
    String? id,
    required this.poster,
    required this.name,
    required this.description,
    required this.year,
    this.watched = false,
    this.rating
  }) : id = id ?? uuid.v4();
}


List<Movie> sampledMovies = [
  Movie(
    poster:
    "https://upload.wikimedia.org/wikipedia/ru/d/d3/Son_of_Saul_poster.jpg",
    name: "Son of Saul",
    description: "one of very few real films about Holocaust",
    year: 2015,
    watched: true,
    rating: 4,
  ),
  Movie(
    poster:
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSo0BdndC0OBvVL8nUmsvcTGbbjb2Ulbyh64g&s",
    name: "Forrest Gump",
    description: "A fairy tale for kids and adults",
    year: 1994,
    watched: true,
    rating: 5,
  ),
  Movie(
    poster:
    "https://m.media-amazon.com/images/M/MV5BZTdmNDU1ZjktYzM3NC00ZDMwLWJiNzItNzE0MzAwYTk3NDNiXkEyXkFqcGc@._V1_.jpg",
    name: "Il peccato",
    description: "Film about the life of Michelangelo",
    year: 2019,
  ),
  Movie(
    poster:
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQY8mjQnxWxY5LNXWpUE43Ya3KYrt-p3OB0eA&s",
    name: "Saraband",
    description: "Another film by Ingmar Bergman",
    year: 2003,
  ),
];