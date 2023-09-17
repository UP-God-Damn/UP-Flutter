// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:up/url.dart';
import 'package:up/reply/reply.dart';

Future commentModiFy(id, commentTextId, comment) async {
  final url = '$baseUrl/comment/$commentTextId';

  const storage = FlutterSecureStorage();
  final token = await storage.read(key: 'accessToken');

  final response = await http.patch(
    Uri.parse(url),
    headers: {
      'Content-Type': 'application/json',
      HttpHeaders.authorizationHeader: 'Bearer $token',
    },
    body: jsonEncode({
      "id": id,
      "content": comment,
    }),
  );

  if (response.statusCode != 200) {
    throw Exception(response.body);
  }
}

class CommentModeFy extends StatefulWidget {
  final String commentTextId, content;
  final int id;

  const CommentModeFy({
    required this.commentTextId,
    required this.id,
    required this.content,
    super.key,
  });

  @override
  State<CommentModeFy> createState() => _CommentModeFyState();
}

class _CommentModeFyState extends State<CommentModeFy> {
  @override
  Widget build(BuildContext context) {
    final int id = widget.id;
    final String commentTextId = widget.commentTextId;

    TextEditingController commentController =
        TextEditingController(text: widget.content);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF3F3F3),
        elevation: 5,
        title: Text(
          '댓글 수정하기',
          style: TextStyle(
            color: const Color(0xFF000000),
            fontSize: 20.sp,
            fontWeight: FontWeight.w400,
            fontFamily: 'NotoSansKR',
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: 30.h, bottom: 36.h),
              child: Container(
                width: 390.w,
                height: 520.h,
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFFABABAB)),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: commentController,
                  maxLines: 1000,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                  ),
                ),
              ),
            ),
          ),
          //
          //
          /// 수정하기 버튼
          Center(
            child: GestureDetector(
              onTap: () async {
                if (commentController.text.length < 5) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('댓글이 생성되지 않았습니다.'),
                        content: const Text('글자수 제한(5글자 이하)'),
                        actions: [
                          MaterialButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('확인'),
                          )
                        ],
                      );
                    },
                  );
                } else if (commentController.text.length > 5000) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('댓글이 생성되지 않았습니다.'),
                        content: const Text('글자수 제한(5000글자 이상)'),
                        actions: [
                          MaterialButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('확인'),
                          )
                        ],
                      );
                    },
                  );
                } else {
                  // commentIdController.addCommentId(
                  //   id,
                  //   commentTextController.text,
                  // );
                  commentModiFy(id, commentTextId, commentController.text);

                  await showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('댓글이 생성되었습니다'),
                        actions: [
                          MaterialButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('확인'),
                          )
                        ],
                      );
                    },
                  );
                  //
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => CommentDetails(id: id),
                      ),
                      (route) => false);
                }
              },
              child: Container(
                width: 390.w,
                height: 45.h,
                decoration: BoxDecoration(
                  color: const Color(0xFF191C1B),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    '수정하기',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'NotoSansKR',
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
