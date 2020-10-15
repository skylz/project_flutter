import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BankAccount with ChangeNotifier {
  int _balance = 0;

  int getBalance() {
    return _balance;
  }

  void increment(int value) {
    _balance += value;
    notifyListeners();
  }

  void decrement(int value) {
    _balance -= value;
    notifyListeners();
  }
}
