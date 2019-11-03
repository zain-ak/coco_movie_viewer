import 'package:coco_movie_viewer/services/movie_model.dart';
import 'package:coco_movie_viewer/widgets/movie_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Movies extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<MovieModel>(
      builder: (context, movieModel, child) =>
          MovieList(movies: movieModel.movies));
  }

}