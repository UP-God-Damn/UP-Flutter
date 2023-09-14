import 'package:flutter/material.dart';

class UserIdControllder extends ChangeNotifier {
  String _userid = '';

  String get userid => _userid;

  void getUserId(value) {
    _userid = value;
    notifyListeners();
  }
}
