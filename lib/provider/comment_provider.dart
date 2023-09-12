import 'package:flutter/material.dart';

class CommentController extends ChangeNotifier {
  final List<String> _commentList = [];
  final List<String> _userProfileList = [];
  final List<String> _userNicknameList = [];
  final List<String> _dayList = [];

  List get commentlist => _commentList;

  List get userProfileList => _userProfileList;

  List get userNicknameList => _userNicknameList;

  List get dayList => _dayList;

  void commentAdd(
      {required String comment,
      required String name,
      required String image,
      required String day}) {
    _commentList.add(comment);
    _userNicknameList.add(name);
    _userProfileList.add(image);
    _dayList.add(day);
    notifyListeners(); //setState같은 애
  }
}
