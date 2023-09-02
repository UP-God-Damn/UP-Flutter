import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:up/Sign in and Sign up/sign_up.dart';
import 'package:up/mainscreen/mainpage.dart';
import 'package:up/model/postLogin.dart';
import 'package:up/url.dart';

Future<LoginToken> postLoginToken(String id, String pw) async {
  ///URL
  var url = '$baseUrl/user/login';
  final response = await http.post(
    Uri.parse(url),
    headers: {'Content-Type': 'application/json'}, //필수
    body: jsonEncode({"accountId": id, "password": pw}),
  );
  if (response.statusCode == 201) {
    return LoginToken.fromJson(jsonDecode(
        utf8.decode(response.bodyBytes))); //utf8.decode(response.bodyBytes);
  } else {
    throw Exception(response.body);
  }
}

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _id = TextEditingController();
  final _pw = TextEditingController();

  final storage = const FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF191C1B),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
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
                          Icons.arrow_back_ios_new,
                          color: Colors.white,
                        )),
                    SizedBox(height: 70.h),
                  ],
                ),
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
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(top: 91.h),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      color: Color(0xFFF3F3F3),
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(80)),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 66.h),
                          child: Text(
                            '로그인',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 35.sp,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'NotoSansKR',
                            ),
                          ),
                        ),
                        //
                        //
                        //
                        ///아이디 입력탭
                        Padding(
                          padding: EdgeInsets.only(top: 51.h),
                          child: Column(
                            children: [
                              /// 아이디 제목
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 60.h),
                                    child: Text(
                                      '아이디',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'NotoSansKR',
                                        fontSize: 15.sp,
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              /// 입력탭
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
                                    child: Center(
                                      child: TextField(
                                        controller: _id,
                                        decoration: const InputDecoration(
                                          hintText: '아이디를 입력해주세요',
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        //
                        //
                        //
                        ///비밀먼호 입력탭
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 20.h),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 61.h),
                                    child: Text(
                                      '비밀번호',
                                      style: TextStyle(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'NotoSansKR',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
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
                        //
                        //
                        //
                        ///로그인 확인 버튼
                        Padding(
                          padding: EdgeInsets.only(top: 50.h),
                          child: GestureDetector(
                            onTap: () {
                              postLoginToken(_id.text, _pw.text).then((value) {
                                if (value.accessToken != null) {
                                  storage.write(
                                      key: 'accessToken',
                                      value: value.accessToken);
                                  storage.write(
                                      key: 'refreshToken',
                                      value: value.refreshToken);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const MainPage(),
                                      ));
                                }
                              });
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
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 8.h),
                          child: Row(
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
                                  Navigator.pushNamedAndRemoveUntil(
                                      context, '/', (_) => false);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const SignUp()),
                                  );
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
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
