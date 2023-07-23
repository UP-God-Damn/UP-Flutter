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
          SizedBox(height: 168.w),
          Image.asset(
            'assets/img/slogo.png',
            width: 124.94.w,
            height: 66.72.h,
          ),
          SizedBox(height: 21.h),
          Text(
            '해결하지 못한 에러를 해결해드립니다',
            style: TextStyle(
              color: Colors.white,
              fontSize: 17.sp,
            ),
          ),
          SizedBox(height: 225.h),
          Container(
            width: double.infinity,
            height: 430.h,
            decoration: const BoxDecoration(
              color: Color(0xFFF3F3F3),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(80)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 143.h),
                //로그인 버튼
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignIn(),
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
                          SizedBox(height: 16.h),
                          Text(
                            '로그인',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 17.sp,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 25.h),
                //회원가입 버튼
                GestureDetector(
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
                          SizedBox(height: 16.h),
                          Text(
                            '회원가입',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 17.sp,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
