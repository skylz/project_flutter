import 'package:flutter/material.dart';
import 'package:movie_mvmm/models/movie.dart';

class MovieViewModel extends ChangeNotifier {
  final Movie movie;

  MovieViewModel({this.movie});

  String get title => movie.title;

  String get poster => movie.poster;
}
