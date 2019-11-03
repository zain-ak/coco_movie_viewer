import 'package:cached_network_image/cached_network_image.dart';
import 'package:coco_movie_viewer/constants.dart';
import 'package:coco_movie_viewer/models/movie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'movie_details.dart';

class MovieItem extends StatelessWidget {
  final Movie movie;
  MovieItem({@required this.movie});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => MovieDetails(movie: movie)
        ));
      },
      child: GridTile(
        child: CachedNetworkImage(
          imageUrl: Constant.ImageBaseURL+movie.posterImageURL,
          fit: BoxFit.cover
        ),
        footer: Text(movie.name)
      ),
    );
  }
}