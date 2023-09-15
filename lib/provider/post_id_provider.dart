import 'package:flutter/material.dart';
import 'package:up/create/createbody.dart';
import 'package:up/model/createId.dart';

class PostIdController extends ChangeNotifier {
  String _postId = '오류';

  String get postId => _postId;

  void addPostId(title, language, content, selectedState, major) async {
    final CreateId postID =
        await postCreate(title, language, content, selectedState, major);
    _postId = postID.id.toString();
    notifyListeners();
  }
}
