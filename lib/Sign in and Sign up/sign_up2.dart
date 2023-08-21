import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:up/Sign%20in%20and%20Sign%20up/choose.dart';

class SignUp2 extends StatefulWidget {
  const SignUp2({super.key});

  @override
  State<SignUp2> createState() => _SignUp2State();
}

class _SignUp2State extends State<SignUp2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF191C1B),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 40.h),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 62.h),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 830.h,
            decoration: const BoxDecoration(
              color: Color(0xFFF3F3F3),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(80)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 84.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '회원가입',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 35.sp,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'NotoSansKR',
                        ),
                      ),
                    ],
                  ),
                ),
                //
                //
                //
                ///프로필 이미지
                Padding(
                  padding: EdgeInsets.only(left: 91.w, top: 50.h, bottom: 3.h),
                  child: Text(
                    '프로필 이미지',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15.sp,
                      fontFamily: 'NotoSansKR',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                //
                //
                //
                ///이미지를 삽입해주세요
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 80.w),
                      child: GestureDetector(
                        child: Container(
                          width: 270.w,
                          height: 270.h,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset("assets/img/Image.png"),
                                Text(
                                  '이미지를 삽입해주세요',
                                  style: TextStyle(
                                    color: const Color(0xFF767676),
                                    fontSize: 10.sp,
                                    fontFamily: 'NotoSansKR',
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 85.w, top: 10.h),
                      child: Text(
                        '프로필 이미지를 설정하지 않을 경우에는 기본 프로필로 설정됩니다.',
                        style: TextStyle(
                          color: const Color(0xFFFF0000),
                          fontSize: 8.sp,
                          fontFamily: 'NotoSansKR',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    ///회원가입 버튼
                    Padding(
                      padding: EdgeInsets.only(top: 50.h, left: 50.w),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamedAndRemoveUntil(
                              context, '/', (_) => false);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Choose(),
                            ),
                          );
                        },
                        child: Container(
                          width: 330.w,
                          height: 45.h,
                          decoration: const BoxDecoration(
                            color: Color(0xFF191C1B),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Center(
                            child: Text(
                              '회원가입',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.sp,
                                fontFamily: 'NotoSansKR',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
