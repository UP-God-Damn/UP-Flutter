// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:up/mainscreen/mainpage.dart';

import 'package:up/provider/userId_provider.dart';
import 'package:up/reply/reply.dart';
import 'package:up/modify/modefy.dart';
import 'package:up/url.dart';

Future delPost(String id) async {
  final url = '$baseUrl/post/$id';
  const storage = FlutterSecureStorage();
  final token = await storage.read(key: 'accessToken');

  final response = await http.delete(
    Uri.parse(url),
    headers: {
      'Content-Type': 'application/json',
      HttpHeaders.authorizationHeader: 'Bearer $token',
    },
  );

  if (response.statusCode != 204) {
    throw Exception(response.body);
  }
}

class DetailsBody extends StatefulWidget {
  final String id, tag, major, language, userId;
  final String content, day, nickname, profileImage, file;

  const DetailsBody(
      {required this.id,
      required this.tag,
      required this.major,
      required this.language,
      required this.content,
      required this.day,
      required this.nickname,
      required this.profileImage,
      required this.file,
      required this.userId,
      super.key});

  @override
  State<DetailsBody> createState() => _DetailsBodyState();
}

class _DetailsBodyState extends State<DetailsBody> {
  @override
  Widget build(BuildContext context) {
    final id = widget.id;
    final major = widget.major;
    final language = widget.language;
    final content = widget.content;
    final day = widget.day;
    final profileImage = widget.profileImage;
    final nickname = widget.nickname;
    final file = widget.file;
    final userId = widget.userId;

    var userIdController = Provider.of<UserIdControllder>(context);

    return SingleChildScrollView(
      child: Column(
        children: [
          //
          //
          //
          ///내용
          Padding(
            padding: EdgeInsets.fromLTRB(20.w, 31.64.h, 20.w, 9.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '내용',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'NotoSansKR',
                  ),
                ),
                Row(
                  children: [
                    /// 오류,해결 태그
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
                        child: Center(
                          child: Text(
                            language,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'NotoSansKR',
                            ),
                          ),
                        ),
                      ),
                    ),

                    /// 전공 태그
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
                        child: Center(
                          child: Text(
                            major,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'NotoSansKR',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          //
          //
          //
          /// 오류글 내용
          Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 7.h),
            child: Container(
              width: 390.w,
              height: 490.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                border: Border.all(color: const Color(0xFFABABAB)),
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(20.w, 12.h, 20.w, 12.h),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        content,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.sp,
                          fontFamily: 'NotoSansKR',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      file == 'null' ? const Text('') : Image.network(file),
                    ],
                  ),
                ),
              ),
            ),
          ),
          //
          //
          //
          /// 수정, 삭제
          Padding(
            padding: EdgeInsets.only(right: 31.w, bottom: 6.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                /// 수정
                userId == userIdController.userid
                    ? Padding(
                        padding: EdgeInsets.only(right: 18.w),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Modefy(),
                              ),
                            );
                          },
                          child: Row(
                            children: [
                              const Icon(Icons.mode, color: Color(0xFF767676)),
                              SizedBox(width: 4.w),
                              const Text('수정',
                                  style: TextStyle(color: Color(0xFF767676))),
                            ],
                          ),
                        ),
                      )
                    : const SizedBox(),

                /// 삭제
                userId == userIdController.userid
                    ? GestureDetector(
                        onTap: () async {
                          delPost(id.toString());

                          await showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Column(
                                  children: [
                                    Text('알림'),
                                  ],
                                ),
                                content: const Text('삭제가 완료 되었습니다.'),
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
                          Navigator.pushNamedAndRemoveUntil(
                              context, '/', (_) => false);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MainPage(),
                            ),
                          );
                        },
                        child: Row(
                          children: [
                            const Icon(Icons.delete, color: Colors.red),
                            SizedBox(width: 4.w),
                            const Text('삭제',
                                style: TextStyle(color: Colors.red))
                          ],
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
          ),
          //
          //
          //
          /// 프로필, 작성일
          Padding(
            padding: EdgeInsets.only(left: 30.w),
            child: Row(
              children: [
                SizedBox(
                  width: 50.w,
                  height: 50.h,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(1000),
                    child: Image.network(
                      profileImage,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 6.w),
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ///작성일
                      Padding(
                        padding: EdgeInsets.only(right: 20.w, top: 4.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              '작성일 : $day',
                              style: TextStyle(
                                color: const Color(0xFF767676),
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w200,
                                fontFamily: 'NotoSansKR',
                              ),
                            )
                          ],
                        ),
                      ),

                      /// 이름
                      Text(
                        nickname,
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w200,
                          fontFamily: 'NotoSansKR',
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          //
          //
          //
          /// 댓글 보러가기
          Padding(
            padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 10.h),
            child: Container(width: 390.w, height: 1.h, color: Colors.black),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CommentDetails(id: id),
                ),
              );

              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => CommentDetails(id: id),
              //   ),
              // );
            },
            child: Row(
              children: [
                /// 댓글보러가기
                Padding(
                  padding: EdgeInsets.only(left: 30.w, right: 5.w),
                  child: Text(
                    '댓글 보러가기  >',
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'NotoSansKR',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
