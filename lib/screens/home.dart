import 'package:coco_movie_viewer/models/movie.dart';
import 'package:coco_movie_viewer/services/movie_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:coco_movie_viewer/services/movie_model.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  MovieModel mm = MovieModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mm.getPopularMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Coco Movies'),
        
      ),
//      body: SafeArea(
//        child: GridView(
//          gridDelegate: null,
//
//        ),
//      ),
    );
  }

}