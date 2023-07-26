import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar detailsAppbar(title, context) {
  return AppBar(
    backgroundColor: const Color(0xFFF3F3F3),
    centerTitle: false,
    leading: IconButton(
      icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
      onPressed: () {
        Navigator.pop(context);
      },
    ),
    elevation: 3,
    title: Text(
      title,
      style: TextStyle(
        fontSize: 20.sp,
        fontFamily: 'NotoSansKR',
        fontWeight: FontWeight.w200,
        color: Colors.black,
      ),
    ),
  );
}
