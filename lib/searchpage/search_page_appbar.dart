import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:up/Sign%20in%20and%20Sign%20up/choose.dart';

AppBar searchPageAppbar(context) {
  return AppBar(
    backgroundColor: const Color(0xFFF3F3F3),
    centerTitle: true,
    elevation: 4,
    title: Image.asset(
      'assets/img/slogo.png',
      color: Colors.black,
      width: 43.w,
      height: 22.96.h,
    ),
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
    actions: [
      IconButton(
        onPressed: () async {
          await showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('로그아웃을 하시겠습니까?'),
                actions: [
                  MaterialButton(
                      onPressed: () {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                              builder: (context) => const Choose(),
                            ),
                            (route) => false);
                      },
                      child: const Text('예')),
                  MaterialButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('아니요'),
                  ),
                ],
              );
            },
          );
        },
        icon: const Icon(
          Icons.logout,
          color: Colors.black,
        ),
      )
    ],
  );
}
