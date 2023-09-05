import 'package:flutter/material.dart';

class ErrorController extends ChangeNotifier {
  String _issueState = '오류';

  String get issueState => _issueState;

  void outcomeCategory(String value) {
    _issueState = value;
    notifyListeners();
  }
}

class MajorController extends ChangeNotifier {
  String _majorState = 'FRONTEND';

  String get majorState => _majorState;

  void majorCategory(String value) {
    _majorState = value;
    notifyListeners();
  }
}
