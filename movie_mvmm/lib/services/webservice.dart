import 'package:http/http.dart' as http;
import 'package:movie_mvmm/models/movie.dart';
import 'dart:convert';

class Webservice {
  Future<Movie> fetchMovieData({String keyword}) async {
    final String url = 'http://www.omdbapi.com/?i=$keyword&apikey=29bfd4f7';
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      Movie movie = Movie.fromJson(body);
      return movie;
    } else {
      throw Exception('Unalbe to perform reques!');
    }
  }
}
