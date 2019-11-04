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
        header: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Icon(Icons.favorite_border, color: Colors.red[900]),
            Row(children: <Widget>[Padding(
              padding: const EdgeInsets.only(left: 3.0),
              child: Icon(Icons.star, color: Colors.amber),
            ), SizedBox(width: 10.0,), Text(movie.rating), SizedBox(width: 3.0)]),
          ],
        ),
        child: CachedNetworkImage(
          imageUrl: Constant.ImageBaseURL+movie.posterImageURL,
          colorBlendMode: BlendMode.srcOver,
          color: Colors.black.withOpacity(0.3),
          fit: BoxFit.cover
        ),
        footer: Padding(
          padding: const EdgeInsets.only(left: 2.0, right: 2.0),
          child: Text(movie.name, style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500)),
        )
      ),
    );
  }
}