import 'package:flutter/material.dart';
import 'package:todoey_flutter/models/task_data.dart';
import 'package:todoey_flutter/screens/tasks_screen.dart';
import 'package:provider/provider.dart';

// app의 최상단을 MultiProvider로 감싸줌.
// 따라서 하위 위젯들에 Provider 객체를 전달할 수 있음.
void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => TaskData(),
      )
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: TasksScreen());
  }
}
