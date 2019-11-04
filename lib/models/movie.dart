import 'dart:core';

final String columnID = 'id';
final String movieTitle = 'title';
final String movieDescription = 'overview';
final String moviePosterURL = 'poster_path';
final String movieImdb = 'imdb_id';
final String movieRelease = 'release_date';
final String movieRuntime = 'runtime';
final String movieRating = 'vote_average';

class Movie {
  String id;
  String name;
  String description;
  String posterImageURL;
  String imdbID;
  String releaseDate;
  String runtime;
  String rating;

  bool fav;

  Movie({
    this.id, this.name, this.description, this.posterImageURL,
    this.imdbID, this.releaseDate, this.runtime, this.rating
  });

  Movie.fromJSON(Map<String, dynamic> json) {
    id = json['id'].toString();
    name = json['title'];
    description = json['overview'];
    posterImageURL = json['poster_path'];
    releaseDate = json['release_date'];
    rating = json['vote_average'].toString();
  }

  toggleFav() => fav = !fav;

}