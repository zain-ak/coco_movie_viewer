import 'package:coco_movie_viewer/models/movie.dart';
import 'package:coco_movie_viewer/services/movie_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MovieDetails extends StatelessWidget {
  final Movie movie;
  MovieDetails({@required this.movie});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Card(
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))
        ),
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Consumer<MovieModel>(
            builder: (context, movieModel, child) => Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(movie.name),
                Text(movie.releaseDate),

              ],
            ),
          ),
        ),
      ),
    );
  }

}