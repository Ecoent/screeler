import 'package:flutter/material.dart';
import 'home.dart';
import 'genres.dart';
import 'package:screeler/handlers/auth.dart';
import 'package:screeler/helpers/styles.dart';

void main() => runApp(MyApp());

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Screeler!';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> with Auth {
  Home _home = new Home();
  Genres _genres = new Genres();

  @override
  void initState() {
    signIn();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Screeler!'),
            backgroundColor: Styles.screelerColor,
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.movie)),
                Tab(icon: Icon(Icons.style)),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              _home,
              _genres,
            ],
          ),
        ),
      ),
    );
  }
}
