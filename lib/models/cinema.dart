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
    this.rating,
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
  Movie(
    poster:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRX6uebbxSC9CpDWLoemiJEwmYn3DnFcpjnnw&s",
    name: "Amarcord",
    description: "The most classic italian movie of all the time",
    year: 1973,
    watched: true,
    rating: 5,
  ),
  Movie(
    poster:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQwmukVq1YsEx7_gAaXOYHzhgrcuoAG7lnA7Q&s",
    name: "Leviathan",
    description: "Sad movie about the life on the most part of Russia",
    year: 2014,
    watched: true,
    rating: 5,
  ),
  Movie(
    poster:
        "https://upload.wikimedia.org/wikipedia/en/8/82/The_King_of_Havana_poster.jpg?20230220000924",
    name: "The King of Havana",
    description:
        "Set in the Cuban capital during the Special Period, Reynaldo ('Rey'), returns to his old home in the wake of his escape from a juvenile prison, and wanders around Old Havana, meeting with prostitutes Magda and Yunisleidi.",
    year: 2015,
  ),
  Movie(
    poster:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJL5Mi_n9z5Zvw1-XLONWOjfAoPGeFyQj_1A&s",
    name: "A Fistful of Dollars",
    description:
        "A 1964 spaghetti Western film directed by Sergio Leone and starring Clint Eastwood in his first leading role, alongside Gian Maria Volonté, Marianne Koch, Wolfgang Lukschy, Sieghardt Rupp, José Calvo, Antonio Prieto and Joseph Egger.",
    year: 1964,
  ),
];
