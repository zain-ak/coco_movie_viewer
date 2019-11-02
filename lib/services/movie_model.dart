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

  _movies = await http
      .get(Constant.baseURL+'discover/movie?api_key='+
           Constant.apiKey+'&language=en-US&sort_by=popularity.desc'+
           '&include_adult=false&include_video=false&page=1')
      .then((r) => jsonFromAPI(r.body));

//  for (int i = 0; i < _movies.length; i++) {
//    print('${_movies[i].name}');
//  }

  }

  List<Movie> jsonFromAPI(String json) {
    return (jsonDecode(json)['results'] as List)
        .map((e) => Movie.fromJSON(e))
        .toList();
  }
}