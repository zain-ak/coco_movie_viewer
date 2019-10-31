import 'dart:convert';

import 'package:coco_movie_viewer/constants.dart';
import 'package:coco_movie_viewer/models/movie.dart';
import 'package:http/http.dart' as http;

class MovieModel {
  List<Movie> _movies = [];

  Future<void> getPopularMovies() async {
//    _movies = await http TODO: finish implementation
//        .get(Constant.baseURL+'discover/movie?sort_by=popularity.desc')
//        .then((r) => jsonFromAPI(r.body));


  }

  List<Movie> jsonFromAPI(String json) {
    return (jsonDecode(json) as List)
        //.map((e) => Movie.fromJSON(e)) TODO: code the Movie class
        .toList();
  }
}