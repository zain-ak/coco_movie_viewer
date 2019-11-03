import 'package:coco_movie_viewer/models/movie.dart';
import 'package:flutter/cupertino.dart';

import 'movie_item.dart';

class MovieList extends StatelessWidget {
  final List<Movie> movies;
  MovieList({@required this.movies});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      mainAxisSpacing: 1.0,
      crossAxisSpacing: 1.0,
      crossAxisCount: 3,
      children: getMovies(),
    );
  }

  List<Widget> getMovies() {
    return movies.map((movie) => MovieItem(movie: movie))
    .toList();
  }
}