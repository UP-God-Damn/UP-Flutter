import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:up/Sign in and Sign up/sign_up.dart';
import 'package:up/screen/mainpage.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF191C1B),
      body: Column(
        children: [
          SizedBox(
            height: 40.h,
          ),
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.white,
                  )),
              SizedBox(height: 70.h),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/img/slogo.png',
                width: 136.w,
                height: 72.63.h,
              )
            ],
          ),
          SizedBox(height: 91.h),
          Container(
            width: double.infinity,
            height: 656.h,
            decoration: const BoxDecoration(
              color: Color(0xFFF3F3F3),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(80)),
            ),
            child: Column(
              children: [
                SizedBox(height: 66.h),
                Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 35.sp,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'NotoSansKR',
                  ),
                ),
                SizedBox(height: 50.h),
                //아이디 입력탭
                SizedBox(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(width: 60.w),
                          Text(
                            '아이디',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'NotoSansKR',
                              fontSize: 15.sp,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 3.h),
                      Container(
                        width: 330.w,
                        height: 45.h,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: 16.w),
                          child: const TextField(
                            decoration: InputDecoration(
                              hintText: '아이디를 입력해주세요',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                //비밀먼호 입력탭
                SizedBox(
                  child: Column(
                    children: [
                      SizedBox(height: 20.h),
                      Row(
                        children: [
                          SizedBox(width: 61.w),
                          Text(
                            '비밀번호',
                            style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'NotoSansKR',
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 3.h),
                      Container(
                        width: 330.w,
                        height: 45.h,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: 16.w),
                          child: const TextField(
                            decoration: InputDecoration(
                              hintText: '비밀번호를 입력해주세요',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 50.h),
                //로그인 확인 버튼
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MainPage(),
                        ));
                  },
                  child: Container(
                    width: 330.w,
                    height: 45.h,
                    decoration: const BoxDecoration(
                      color: Color(0xFF191C1B),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(top: 14.h),
                      child: Text(
                        '로그인',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'NotoSansKR',
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 8.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '계정이 없으신가요?',
                      style: TextStyle(
                        color: const Color(0xFFABABAB),
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'NotoSansKR',
                      ),
                    ),
                    SizedBox(width: 8.w),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignUp(),
                            ));
                      },
                      child: Text(
                        '회원가입',
                        style: TextStyle(
                          color: const Color(0xFF191C1B),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'NotoSansKR',
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
