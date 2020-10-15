// route_page는 유저의 로그인 상태를 제어하는 것이다.
// 로그인이 이미 된 상태이면 바로 메인 화면으로
// 로그인이 안된 상태이면 로그인 페이지로 유저를 이동시켜 준다.

import 'package:flutter/material.dart';
import 'package:instaclone/tab_page.dart';

class RootPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TabPage();
  }
}

