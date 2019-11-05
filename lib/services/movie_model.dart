import 'dart:collection';
import 'dart:convert';

import 'package:coco_movie_viewer/constants.dart';
import 'package:coco_movie_viewer/models/movie.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class MovieModel extends ChangeNotifier {
  List<Movie> _movies = [];

  UnmodifiableListView<Movie> get movies => UnmodifiableListView(_movies);

  MovieModel() {
    getPopularMovies(page: 1);
    getPopularMovies(page: 2);
  }

  Future<void> getPopularMovies({@required int page}) async {
    if (page == 1) {
      _movies = await http
          .get(Constant.baseURL + 'discover/movie?api_key=' +
          Constant.apiKey + '&language=en-US&sort_by=popularity.desc' +
          '&include_adult=false&include_video=false&page=$page')
          .then((r) => jsonFromAPI(r.body));
      notifyListeners();
    }
  print(_movies.length);
  }

  Future<String> getTrailerID ({@required String movieName}) async {
    http.Response response = await http
            .get('https://www.googleapis.com/youtube/v3/search'
        '?part=snippet&q=$movieName%20trailer&type=video?maxResults=5&order=viewCount&key=${Constant.ytApiKey}');

     return (jsonDecode(response.body));
  }

  List<Movie> jsonFromAPI(String json) {
    return (jsonDecode(json)['results'] as List)
        .map((e) => Movie.fromJSON(e))
        .toList();
  }
}