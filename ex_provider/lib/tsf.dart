import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'account.dart';

class TestSFW extends StatefulWidget {
  @override
  TestSFWState createState() => TestSFWState();
}

class TestSFWState extends State<TestSFW> {
  @override
  Widget build(BuildContext context) {
    // provider 변수를 계속 선언해주어야함.
    BankAccount bankAccount = Provider.of<BankAccount>(context);
    String name = Provider.of<String>(context);

    return Scaffold(
      appBar: AppBar(title: Text("SFW with Prodiver")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Your Name is '$name'"),
            Text("Your balance is ${bankAccount.getBalance()}"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  padding: const EdgeInsets.all(0),
                  child: Text("+1"),
                  onPressed: () {
                    bankAccount.increment(1);
                  },
                ),
                RaisedButton(
                  padding: const EdgeInsets.all(0),
                  child: Text("+10"),
                  onPressed: () {
                    bankAccount.increment(10);
                  },
                ),
                RaisedButton(
                  padding: const EdgeInsets.all(0),
                  child: Text("+100"),
                  onPressed: () {
                    bankAccount.increment(100);
                  },
                ),
                RaisedButton(
                  padding: const EdgeInsets.all(0),
                  child: Text("-1"),
                  onPressed: () {
                    bankAccount.decrement(1);
                  },
                ),
                RaisedButton(
                  padding: const EdgeInsets.all(0),
                  child: Text("-10"),
                  onPressed: () {
                    bankAccount.decrement(10);
                  },
                ),
                RaisedButton(
                  padding: const EdgeInsets.all(0),
                  child: Text("-100"),
                  onPressed: () {
                    bankAccount.decrement(100);
                  },
                ),
              ].map(
                (child) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    width: 40,
                    child: child,
                  );
                },
              ).toList(),
            )
          ],
        ),
      ),
    );
  }
}
