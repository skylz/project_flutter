class Task {
  final String name;
  bool isDone;

  // false는 default value
  Task({this.name, this.isDone = false});

  // checkBox의 상태를 확인하는 함수
  void toggleDone() {
    isDone = !isDone;
  }
}
