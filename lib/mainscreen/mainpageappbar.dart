import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar mainPageAppbar(context) {
  return AppBar(
    backgroundColor: const Color(0xFFF3F3F3),
    leading: Builder(
      builder: (context) {
        return IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          icon: const Icon(Icons.menu, color: Colors.black),
        );
      },
    ),
    title: Image.asset(
      'assets/img/slogo.png',
      color: Colors.black,
      width: 43.w,
      height: 22.96.h,
    ),
    centerTitle: true,
    elevation: 4,
  );
}
