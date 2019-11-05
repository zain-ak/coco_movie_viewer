import 'package:coco_movie_viewer/constants.dart';
import 'package:coco_movie_viewer/models/movie.dart';
import 'package:coco_movie_viewer/services/movie_model.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MovieDetails extends StatelessWidget {
  final Movie movie;
  MovieDetails({@required this.movie});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Card(
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))
        ),
        child: Consumer<MovieModel>(
          builder: (context, movieModel, child) => DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              image: DecorationImage(
                image: NetworkImage(Constant.ImageBaseURL+movie.posterImageURL),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.65), BlendMode.srcOver)
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Text(movie.name, style: TextStyle(
                            color: Colors.white,
                            fontSize: 36.0,
                            fontWeight: FontWeight.bold
                        )),
                      ),
                      Row(children: <Widget>[Icon(Icons.star, color: Colors.amber), SizedBox(width: 10.0,), Text(movie.rating)]),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Text(formatDate(DateTime.parse(movie.releaseDate), [MM, ' - ', yyyy])),
                  SizedBox(height:30.0),
                  Text('Synopsis', style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20.0
                  )),
                  SizedBox(height:10.0),
                  Text(movie.description, style: TextStyle(fontStyle: FontStyle.italic)),
                  SizedBox(height:20.0),
                  YouTubeWindow(name: movie.name)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}

class YouTubeWindow extends StatefulWidget {
  YouTubeWindow({@required this.name});
  final String name;
  @override
  _YouTubeWindow createState() => _YouTubeWindow(name: name);
}

class _YouTubeWindow extends State<YouTubeWindow> {
  _YouTubeWindow({@required this.name});
  final String name;
  String id = '';
  YoutubePlayerController _controller;
  MovieModel mm = MovieModel();

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: 'ZlW9yhUKlkQ',
      flags: YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        forceHideAnnotation: true,
      ),
    );
  }

  void getID() async {
//    mm.getTrailerID(movieName: name);
    String data = await mm.getTrailerID(movieName: name);
    print(data);
//    id = data['items'][0][0]['id'];
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(
      controller: _controller,
      showVideoProgressIndicator: true,
      progressColors: ProgressBarColors(
        playedColor: Colors.amber,
        handleColor: Colors.amberAccent,
      ),
    );
  }
}