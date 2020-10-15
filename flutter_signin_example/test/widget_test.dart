import 'dart:io'; // https 등 서버와 통신할 때 필요한 library

void main() {
  showData();
}

void showData() async{
  startTask();
  String access = await accessData();
  fetchData(access);
}

void startTask() {
  String info = '요청 수행 시작';
  print(info);
}

// 코드가 순서대로 실행되므로 synchronize 방식으로 동작한다고 할 수 있다.
//void accessData() {
//  Duration time = Duration(seconds: 3);
//  sleep(time);
//  String info2 = '데이터에 접속 중';
//  print(info2);
//}

Future<String> accessData() async{

  String account;

  Duration time = Duration(seconds: 3);

  if (time.inSeconds > 2) {
    await Future.delayed(time, () {
      account = '8,500만';
      print(account);
    });
  } else {
    String info2 = '데이터를 가져왔습니다';
    print(info2);
  }

  return account;
}

void fetchData(String account) {
  String info3 = '잔액은 $account원 입니다.';
  print(info3);
}
