import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar replyAppbar(context) {
  return AppBar(
    backgroundColor: const Color(0xFFF3F3F3),
    centerTitle: false,
    elevation: 3,
    leading: IconButton(
      icon: const Icon(
        Icons.arrow_back_ios,
        color: Colors.black,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    ),
    title: Text(
      '댓글 쓰기',
      style: TextStyle(
        fontFamily: 'NotoSansKR',
        color: Colors.black,
        fontSize: 20.sp,
        fontWeight: FontWeight.w200,
      ),
    ),
  );
}
