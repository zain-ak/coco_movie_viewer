import 'package:coco_movie_viewer/screens/home.dart';
import 'package:coco_movie_viewer/services/movie_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) => MovieModel(),
      child: MaterialApp(
        theme: ThemeData.dark(),
        home: HomeScreen(),
      ),
    );
  }
}