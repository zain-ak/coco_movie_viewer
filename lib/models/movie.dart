import 'dart:convert';
import 'dart:core';
import 'dart:core';
import 'package:flutter/foundation.dart';

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

//  Movie.fromJSON(Map<String, dynamic> json)
}