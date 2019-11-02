import 'package:coco_movie_viewer/tabs/favorites.dart';
import 'package:coco_movie_viewer/tabs/movies.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rect_getter/rect_getter.dart';

class HomeScreen extends StatefulWidget {


  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentTab = 0;
  List<Widget> _tabs;

  final bottomBarModels = <BottomNavigationBarItem> [
    BottomNavigationBarItem(icon: new Icon(Icons.home), title: new Text('')),
    BottomNavigationBarItem(icon: new Icon(Icons.favorite_border), title: new Text(''))
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabs = [
      Movies(),
      Favorites(),
    ];
  }

  void _onTab (int value) {
    setState(() {
      _currentTab = value;

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: _tabs[_currentTab],
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(bottom: 12.0),
          child: Stack(
            children: <Widget>[
              BottomNavigationBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                selectedIconTheme: IconThemeData(
                  color: Colors.orange[300],
                  size: 26.0
                ),
                currentIndex: _currentTab,
                items: bottomBarModels,
                onTap: _onTab,
              )
            ],
          )
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