import 'package:movie_mvmm/services/webservice.dart';
import 'package:movie_mvmm/viewmodels/movieViewModel.dart';
import 'package:flutter/foundation.dart';

class MovieListViewModel extends ChangeNotifier {
  List<MovieViewModel> movies = List<MovieViewModel>();

  // FIXME: fetchMovies가 web에서 api를 호출해서 이를 listview로 생성할 수 있는 list type으로 변환해준다.
  // FIXME: 그렇기 때문에 여기에 notifyListeners가 사용되는 것이다.
  Future<void> fetchMovies(String movieTitle) async {
    final results = await Webservice().fetchMovieData(keyword: movieTitle);
    var movieValue = MovieViewModel(movie: results);
    movies.add(movieValue);
    print(movies);
    notifyListeners();
  }
}
