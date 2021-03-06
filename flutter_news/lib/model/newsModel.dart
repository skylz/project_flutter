import '../model/commentModel.dart';

// News 객체 모델링
class News {
  final String heading;
  final String subheading;
  final String author;
  final List<String> content;
  List<bool> heartFill;
  List<bool> heartState;
  List<int> heartCount;
  List<List<Comment>> listDemoComment;

  News(
      {this.heading,
      this.subheading,
      this.author,
      this.content,
      this.heartFill,
      this.heartState,
      this.heartCount,
      this.listDemoComment});
}
