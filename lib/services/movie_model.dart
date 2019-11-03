import 'dart:collection';
import 'dart:convert';

import 'package:coco_movie_viewer/constants.dart';
import 'package:coco_movie_viewer/models/movie.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class MovieModel extends ChangeNotifier {
  List<Movie> _movies = [];

  UnmodifiableListView<Movie> get movies => UnmodifiableListView(_movies);

  Future<void> getPopularMovies({@required int page}) async {
  _movies = await http
      .get(Constant.baseURL+'discover/movie?api_key='+
           Constant.apiKey+'&language=en-US&sort_by=popularity.desc'+
           '&include_adult=false&include_video=false&page=$page')
      .then((r) => jsonFromAPI(r.body));
  notifyListeners();
//  for (int i = 0; i < _movies.length; i++) {
//    print('${_movies[i].name}');
//  } test loop

  }

  List<Movie> jsonFromAPI(String json) {
    return (jsonDecode(json)['results'] as List)
        .map((e) => Movie.fromJSON(e))
        .toList();
  }
}