// Flutter code sample for material.BottomNavigationBar.1

// This example shows a [BottomNavigationBar] as it is used within a [Scaffold]
// widget. The [BottomNavigationBar] has three [BottomNavigationBarItem]
// widgets and the [currentIndex] is set to index 0. The selected item is
// amber. The `_onItemTapped` function changes the selected item's index
// and displays a corresponding message in the center of the [Scaffold].
//
// ![A scaffold with a bottom navigation bar containing three bottom navigation
// bar items. The first one is selected.](https://flutter.github.io/assets-for-api-docs/assets/material/bottom_navigation_bar.png)

import 'package:flutter/material.dart';
import 'package:screeler/handlers/firestore.dart';
import 'package:http/http.dart' as http;
import 'package:screeler/handlers/requests.dart';

/// This Widget is the main application widget.
class Genres extends StatelessWidget {
  static const String _title = 'Screeler!';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: GenreStatefulWidget(),
    );
  }
}

class GenreStatefulWidget extends StatefulWidget {
  GenreStatefulWidget({Key key}) : super(key: key);

  @override
  _GenreStatefulWidgetState createState() => _GenreStatefulWidgetState();
}

class _GenreStatefulWidgetState extends State<GenreStatefulWidget>
    with Requests {
  dynamic _movieGenres;

  Future<http.Response> getGenres() async {
    dynamic movieGenres = await getMovieGenres();
    print(movieGenres);
    setState(() {
      _movieGenres = movieGenres;
    });
  }

  @override
  void initState() {
    _init();
    super.initState();
  }

  Future _init() async {
    var userGenres = await FireStore.getUserGenres();
    getGenres();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(bottom: 20.0),
          child: Text(
            _movieGenres.toString(),
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                decoration: TextDecoration.none),
          ),
        ),
      ],
    );
  }
}
