import 'package:flutter/material.dart';
import 'package:up/create/createbody.dart';
import 'package:up/model/createId.dart';

class PostIdController extends ChangeNotifier {
  int _postId = 00000;

  int get postId => _postId;

  Future addPostId(title, language, content, selectedState, major) async {
    final CreateId postID =
        await postCreate(title, language, content, selectedState, major);
    _postId = postID.id!.toInt();
    notifyListeners();
  }
}
