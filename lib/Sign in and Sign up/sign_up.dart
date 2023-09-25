import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:up/Sign in and Sign up/sign_in.dart';
import 'package:up/mainscreen/mainpage.dart';

import 'package:up/model/postSignUp.dart';
import 'package:up/url.dart';

Future<SignUpToken> postSignUp(String nickname, String id, String pw) async {
  ///URL
  var url = '$baseUrl/user/signup';
  final response = await http.post(
    Uri.parse(url),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({
      "nickname": nickname,
      "accountId": id,
      "password": pw,
    }),
  );

  if (response.statusCode == 201) {
    return SignUpToken.fromJson(jsonDecode(
        utf8.decode(response.bodyBytes))); //utf8.decode(response.bodyBytes);
  } else {
    throw Exception(response.body);
  }
}

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

  final storage = const FlutterSecureStorage();

  bool? reid, pwpw;

  getReSignUp(String id) async {
    var url = '$baseUrl/user/$id';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      setState(() {
        reid = true;
      });
    } else {
      setState(() {
        reid = false;
      });
    }
  }

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
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 62.h),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color(0xFFF3F3F3),
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(80)),
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
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: 3.h, left: 50.w, right: 5.w),
                                    child: Container(
                                      width: 239.w,
                                      height: 45.h,
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
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
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      getReSignUp(_id.text);
                                    },
                                    child: Container(
                                      width: 86.w,
                                      height: 42.h,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFF191C1B),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Center(
                                        child: Text(
                                          '중복확인',
                                          style: TextStyle(
                                            color: const Color(0xFFFFFFFF),
                                            fontSize: 11.sp,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'NotoSansKR',
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(left: 61.w, bottom: 3.h),
                        child: Text(
                          reid == null
                              ? ''
                              : reid == true
                                  ? '아이디가 사용 가능합니다'
                                  : '아이디가 중복되었습니다',
                          style: TextStyle(
                            color: reid == true ? Colors.green : Colors.red,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'NotoSansKR',
                          ),
                        ),
                      ),
                      //
                      //
                      //
                      ///비밀번호
                      SizedBox(
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
                                    obscureText: true,
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
                                      obscureText: true,
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
                      Padding(
                        padding: EdgeInsets.only(left: 61.w, bottom: 3.h),
                        child: Text(
                          pwpw == null
                              ? ''
                              : pwpw == true
                                  ? '비밀번호가 일치합니다.'
                                  : '비밀번호가 일치하지 않습니다.',
                          style: TextStyle(
                            color: pwpw == true ? Colors.green : Colors.red,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'NotoSansKR',
                          ),
                        ),
                      ),
                      //
                      //
                      //
                      Column(
                        children: [
                          ///회원가입 버튼
                          Padding(
                            padding: EdgeInsets.only(top: 40.h),
                            child: GestureDetector(
                              onTap: () {
                                if (_pw.text == _repw.text) {
                                  setState(() {
                                    pwpw = true;
                                  });
                                  postSignUp(_nickname.text, _id.text, _pw.text)
                                      .then((value) {
                                    if (value.accessToken != null) {
                                      if (_pw.text == _repw.text) {
                                        storage.write(
                                            key: 'accessToken',
                                            value: value.accessToken);
                                        storage.write(
                                            key: 'refreshToken',
                                            value: value.refreshToken);
                                        Navigator.of(context)
                                            .pushAndRemoveUntil(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const MainPage()),
                                                (route) => false);
                                      }
                                    }
                                  });
                                } else {
                                  setState(() {
                                    pwpw = false;
                                  });
                                }
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
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
