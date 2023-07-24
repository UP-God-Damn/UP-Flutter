import 'package:flutter/material.dart';

import 'package:up/Sign in and Sign up/sign_in.dart';
import 'package:up/Sign in and Sign up/sign_up.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class Choose extends StatefulWidget {
  const Choose({super.key});

  @override
  State<Choose> createState() => _ChooseState();
}

class _ChooseState extends State<Choose> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF191C1B),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 168.h),
            child: Image.asset(
              'assets/img/slogo.png',
              width: 124.94.w,
              height: 66.72.h,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 21.h),
            child: Text(
              '해결하지 못한 에러를 해결해드립니다',
              style: TextStyle(
                fontFamily: 'NotoSansKR',
                color: Colors.white,
                fontSize: 17.sp,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 225.h),
            child: Container(
              width: double.infinity,
              height: 430.h,
              decoration: const BoxDecoration(
                color: Color(0xFFF3F3F3),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(80)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //로그인 버튼
                  Padding(
                    padding: EdgeInsets.only(top: 143.h),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignIn(),
                          ),
                        );
                      },
                      child: Container(
                        width: 350.w,
                        height: 49.h,
                        decoration: const BoxDecoration(
                          color: Color(0xFF191C1B),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: SizedBox(
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 16.h),
                                child: Text(
                                  '로그인',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: 'NotoSansKR',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17.sp,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  //회원가입 버튼
                  Padding(
                    padding: EdgeInsets.only(top: 25.h),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignUp(),
                            ));
                      },
                      child: Container(
                        width: 350.w,
                        height: 49.h,
                        decoration: const BoxDecoration(
                          color: Color(0xFF191C1B),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: SizedBox(
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 16.h),
                                child: Text(
                                  '회원가입',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: 'NotoSansKR',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17.sp,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
