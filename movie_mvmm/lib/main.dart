import 'package:flutter/material.dart';
import 'package:movie_mvmm/services/webservice.dart';
import 'package:movie_mvmm/viewmodels/movieListViewModel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MovieListViewModel()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Movies",
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlatButton(
                color: Colors.black,
                onPressed: () {
                  Webservice().fetchMovieData(keyword: 'tt3896198');
                },
                child: Text('test',
                    style: TextStyle(
                      color: Colors.white,
                    )))
          ],
        ),
      ),
    );
  }
}
