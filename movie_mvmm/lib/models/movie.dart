class Movie {
  final String title;
  final String poster;

  Movie({this.title, this.poster});

  // FIXME: Movie.fromJson에다가 api로 호출된 json 파일을 넣으면 title과 Poster를 객체 형태로 가져올 수 있음.

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(title: json['Title'], poster: json['Poster']);
  }
}
