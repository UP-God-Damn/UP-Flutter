import 'package:flutter/material.dart';

import 'package:up/Sign in and Sign up/sign_in.dart';
import 'package:up/widget/customdropdown.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _nickname = TextEditingController(); // 닉네임
  final _id = TextEditingController(); //아이디
  final _pw = TextEditingController(); //비밀번호
  final _repw = TextEditingController(); //비밀번호 확인

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
                        'Sign Up',
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
                //
                ///닉네임
                Padding(
                  padding: EdgeInsets.only(top: 32.h),
                  child: SizedBox(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(width: 61.w),
                            Text(
                              '닉네임',
                              style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'NotoSansKR',
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 3.h),
                          child: Container(
                            width: 330.w,
                            height: 45.h,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left: 16.w),
                              child: TextField(
                                controller: _nickname,
                                decoration: const InputDecoration(
                                  hintText: '닉네임을 입력해주세요',
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                //
                //
                //
                ///아이디
                Padding(
                  padding: EdgeInsets.only(top: 20.h),
                  child: SizedBox(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(width: 61.w),
                            Text(
                              '아이디',
                              style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'NotoSansKR',
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 3.h),
                          child: Container(
                            width: 330.w,
                            height: 45.h,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left: 16.w),
                              child: TextField(
                                controller: _id,
                                decoration: const InputDecoration(
                                  hintText: '아이디를 입력해주세요',
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                //
                //
                //
                ///비밀번호
                Padding(
                  padding: EdgeInsets.only(top: 20.h),
                  child: SizedBox(
                    child: Column(
                      children: [
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
                        Padding(
                          padding: EdgeInsets.only(top: 3.h),
                          child: Container(
                            width: 330.w,
                            height: 45.h,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left: 16.w),
                              child: TextField(
                                controller: _pw,
                                decoration: const InputDecoration(
                                  hintText: '비밀번호를 입력해주세요',
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                //
                //
                //
                ///비밀번호 확인
                Padding(
                  padding: EdgeInsets.only(top: 20.h),
                  child: SizedBox(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(width: 61.w),
                            Text(
                              '비밀번호 확인',
                              style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'NotoSansKR',
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 3.h),
                          child: Container(
                            width: 330.w,
                            height: 45.h,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left: 16.w),
                              child: TextField(
                                controller: _repw,
                                decoration: const InputDecoration(
                                  hintText: '비밀번호를 다시 입력해주세요',
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                //
                //
                //
                ///전공
                Padding(
                  padding: EdgeInsets.only(top: 20.h),
                  child: SizedBox(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(width: 61.w),
                            Text(
                              '전공',
                              style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'NotoSansKR',
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 3.h),
                          child: Container(
                            width: 330.w,
                            height: 45.h,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: const SignUpDropdown(),
                          ),
                        ),

                        ///회원가입 버튼
                        Padding(
                          padding: EdgeInsets.only(top: 50.h),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              width: 330.w,
                              height: 45.h,
                              decoration: const BoxDecoration(
                                color: Color(0xFF191C1B),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
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

                        ///계정이 있으신가요?
                        Padding(
                          padding: EdgeInsets.only(top: 5.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '계정이 있으신가요?',
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
                                  Navigator.pushNamedAndRemoveUntil(
                                      context, '/', (_) => false);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const SignIn()),
                                  );
                                },
                                child: Text(
                                  '로그인',
                                  style: TextStyle(
                                    color: const Color(0xFF191C1B),
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'NotoSansKR',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
