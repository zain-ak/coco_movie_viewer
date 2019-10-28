import 'package:coco_movie_viewer/MovieItem.dart';
import 'package:flutter/material.dart';

void main() {
  return runApp(
      MaterialApp(
        home: Scaffold (
          backgroundColor: Colors.orange[300],
          body: SafeArea (
              child: CocoMovie()
          ),
        ),
      ),
  );
}
class CocoMovie extends StatefulWidget {
    _CocoMovieState createState() => _CocoMovieState();
  }

class _CocoMovieState extends State<CocoMovie>  {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width/4;
    double height = width*2;
    print('Width: $width, Height: $height');
    return GridView.count(
      primary: false,
      padding: const EdgeInsets.all(10.0),
      crossAxisSpacing: 1.0,
      mainAxisSpacing: 1.0,
      crossAxisCount: 3,
      children: <Widget>[
        MovieItem(height, width),
        MovieItem(height, width),
        MovieItem(height, width)
      ],
    );
  }
}