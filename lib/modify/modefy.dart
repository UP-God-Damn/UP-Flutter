// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:provider/provider.dart';
import 'package:up/mainscreen/mainpage.dart';
import 'package:up/provider/error_provider.dart';

import 'package:up/url.dart';

import 'package:up/widget/errorDropdown.dart';
import 'package:up/widget/majorDropdown.dart';

Future postModefy(int id, String title, String language, String content,
    String selectedState, String major) async {
  const storage = FlutterSecureStorage();
  final token = await storage.read(key: 'accessToken');

  var url = '$baseUrl/post/$id';
  var state = selectedState == '오류' ? 'QUESTION' : 'SOLUTION';

  final response = await http.patch(
    Uri.parse(url),
    headers: {
      'Content-Type': 'application/json',
      HttpHeaders.authorizationHeader: 'Bearer $token',
    },
    body: jsonEncode({
      "title": title,
      "content": content,
      "language": language,
      "state": state,
      "major": major,
    }),
  );

  if (response.statusCode != 200) {
    throw Exception(response.body);
  }
}

class Modefy extends StatelessWidget {
  final int id;
  final String title, cotent, language;

  const Modefy(
      {required this.id,
      required this.title,
      required this.cotent,
      required this.language,
      super.key});

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController(text: title);
    final contentController = TextEditingController(text: cotent);
    final languageController = TextEditingController(text: language);

    var errorController = Provider.of<ErrorController>(context, listen: false);
    var majorController = Provider.of<MajorController>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF3F3F3),
        centerTitle: false,
        elevation: 3,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          '글 수정하기',
          style: TextStyle(
            fontFamily: 'NotoSansKR',
            color: Colors.black,
            fontSize: 20.sp,
            fontWeight: FontWeight.w200,
          ),
        ),
      ),
      //
      //
      //
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            //
            //
            //
            /// 드롭다운들
            Padding(
              padding: EdgeInsets.only(top: 21.64.h, right: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 6.w),
                    child: Container(
                      width: 89.w,
                      height: 25.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(7)),
                        border: Border.all(color: const Color(0xFFABABAB)),
                      ),

                      /// 오류 / 해결 드롭다운
                      child: const ErrorDropdown(),
                    ),
                  ),
                  Container(
                    width: 110.w,
                    height: 25.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(Radius.circular(7)),
                      border: Border.all(color: const Color(0xFFABABAB)),
                    ),
                    child: const Center(child: MajorDropdown()),
                  ),
                ],
              ),
            ),
            //
            //
            //
            ///제목 , 오류코드를 입력해주세요
            Padding(
              padding: EdgeInsets.only(top: 9.h, left: 28.w),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 7.w),
                    child: Text(
                      '제목',
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'NotoSansKR',
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Text(
                    '※오류코드를 입력해주세요',
                    style: TextStyle(
                      fontSize: 10.sp,
                      fontFamily: 'NotoSansKR',
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                ],
              ),
            ),
            //
            //
            //
            /// 제목입력 TextField
            Padding(
              padding: EdgeInsets.fromLTRB(20.w, 5.h, 20.w, 10.h),
              child: Container(
                width: 390.w,
                height: 45.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  border: Border.all(color: const Color(0xFFABABAB)),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 15.w, right: 15.w),
                  child: TextField(
                    controller: titleController,
                    style: TextStyle(fontSize: 15.sp),
                    decoration: InputDecoration(
                      hintStyle:
                          TextStyle(fontSize: 15.sp, fontFamily: 'NotoSansKR'),
                      hintText: '제목을 입력해주세요',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
            //
            //
            //
            /// 사용한 프로그래밍 언어(제목)
            Padding(
              padding: EdgeInsets.only(left: 28.w, bottom: 5.h),
              child: Row(
                children: [
                  Text(
                    '사용한 프로그래밍 언어',
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'NotoSansKR',
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Text(
                    '※모두 소문자로 입력해주세요',
                    style: TextStyle(
                      fontSize: 10.sp,
                      fontFamily: 'NotoSansKR',
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                ],
              ),
            ),
            //
            //
            //
            /// 사용한 프로그래밍 언어 TextField
            Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 14.h),
              child: Container(
                width: 390.w,
                height: 45.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  border: Border.all(color: const Color(0xFFABABAB)),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 15.w, right: 15.w),
                  child: TextField(
                    maxLines: 100000,
                    style: TextStyle(fontSize: 15.sp),
                    controller: languageController,
                    decoration: InputDecoration(
                      hintStyle:
                          TextStyle(fontSize: 15.sp, fontFamily: 'NotoSansKR'),
                      hintText: '사용한 프로그래밍 언어를 적어주세요',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
            //
            //
            //
            /// 내용(제목)
            Padding(
              padding: EdgeInsets.only(left: 28.w, bottom: 10.h),
              child: Row(
                children: [
                  Text(
                    '내용',
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'NotoSansKR',
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            //
            //
            //
            /// 내용 TextField
            Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 10.h),
              child: Container(
                width: 390.w,
                height: 460.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  border: Border.all(color: const Color(0xFFABABAB)),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 15.w, right: 15.w),
                  child: TextField(
                    maxLines: 100000,
                    style: TextStyle(fontSize: 15.sp),
                    controller: contentController,
                    decoration: InputDecoration(
                      hintStyle:
                          TextStyle(fontSize: 15.sp, fontFamily: 'NotoSansKR'),
                      hintText: '내용을 입력해주세요\n코드는 구분하기 쉽게 구분선으로 구분해 주세요',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),

            //
            //
            //
            /// 글 수정하기 Button
            GestureDetector(
              onTap: () async {
                if (titleController.text.length < 5 ||
                    titleController.text.length > 25) {
                  await showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('수정을 실패하였습니다'),
                        content: const Text('제목이 5글자를 넘지 않거나 25글자를 넘겼습니다.'),
                        actions: [
                          MaterialButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('확인'),
                          )
                        ],
                      );
                    },
                  );
                } else if (contentController.text.length < 20 ||
                    contentController.text.length > 10000) {
                  await showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('수정을 실패하였습니다'),
                        content: const Text('내용이 20글자를 넘지 않거나 10000글자를 넘겼습니다.'),
                        actions: [
                          MaterialButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('확인'),
                          )
                        ],
                      );
                    },
                  );
                } else {
                  await postModefy(
                      id,
                      titleController.text,
                      languageController.text,
                      contentController.text,
                      errorController.issueState,
                      majorController.majorState);

                  await showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('수정이 완료 되었습니다.'),
                        actions: [
                          MaterialButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('확인'),
                          )
                        ],
                      );
                    },
                  );
                }

                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => const MainPage(),
                    ),
                    (route) => false);
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
                    '글 수정하기',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'NotoSansKR',
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.2,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
