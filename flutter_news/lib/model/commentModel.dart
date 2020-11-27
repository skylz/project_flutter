class Comment {
  final String userName;
  final String commentDate;
  final String comment;

  Comment({this.userName, this.commentDate, this.comment});
}

List<Comment> demoComments = [
  Comment(
      userName: 'gmlt****',
      commentDate: '2020.11.25. 10:21:07',
      comment: '정말 좋은 기사입니다. 이 기사에서 이 문단이 핵심인것 같네요!'),
  Comment(
      userName: 'hear****',
      commentDate: '2020.11.25. 10:23:15',
      comment: '이 문단은 살짝 편향적인 의견인것 같습니다.'),
  Comment(
      userName: 'kcch****',
      commentDate: '2020.11.25. 10:25:52',
      comment: '저는 살짝 사실이 아니라고 생각하는데, 다른 분들은 어떻게 생각하시나요?'),
  Comment(
      userName: 'rlax****',
      commentDate: '2020.11.25. 10:27:11',
      comment: '저는 그래도 어느정도 지지하는 편입니다.'),
  Comment(
      userName: 'whit****',
      commentDate: '2020.11.25. 10:30:18',
      comment: '저는 반대입니다. 그냥 느낌적으로 아니라는 생각이 드네요.'),
  Comment(
      userName: 'dhtn****',
      commentDate: '2020.11.25. 10:31:22',
      comment: '얼른 갈등이 봉합됐으면 하는 마음입니다.'),
  Comment(
      userName: 'imme****',
      commentDate: '2020.11.25. 10:33:05',
      comment: '빨리 이 사건이 해결되길 바랍니다.')
];
