import 'package:ex_provider/account.dart';
import 'package:ex_provider/tsf.dart';
import 'package:ex_provider/tsl.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      // 앞으로 사용할 provider의 종류를 선언.
      providers: [
        ChangeNotifierProvider(create: (_) => BankAccount()),
        Provider<String>.value(value: "Park")
      ],
      child: MaterialApp(
        title: 'Provider test',
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // provider를 var consumer = Provider.of<Type>(context);의 형태로 계속 호출
    BankAccount bankAccount = Provider.of<BankAccount>(context);
    String name = Provider.of<String>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Provider test'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Your name is $name'),
            Text("Your balance is ${bankAccount.getBalance()}"),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              child: Text("Test with StatefulWidget"),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TestSFW()));
              },
            ),
            RaisedButton(
              child: Text("Test with StatelessWifet"),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TestSLW()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
