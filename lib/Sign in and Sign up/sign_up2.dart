import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:up/Sign in and Sign up/choose.dart';

class SignUp2 extends StatefulWidget {
  final String nickname, id, pw, repw;

  const SignUp2({
    required this.nickname,
    required this.id,
    required this.pw,
    required this.repw,
    super.key,
  });

  @override
  State<SignUp2> createState() => _SignUp2State();
}

class _SignUp2State extends State<SignUp2> {
  XFile? image;
  final ImagePicker picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    final String nickname = widget.nickname;
    final String id = widget.id;
    final String pw = widget.pw;
    final String repw = widget.repw;

    Future<void> getImage(ImageSource imageSource) async {
      final pickedFile =
          await picker.pickImage(source: imageSource, imageQuality: 100);
      setState(() {
        image = XFile(pickedFile!.path);
      });
    }

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
          Expanded(
            child: Container(
              width: double.infinity,
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
                    padding:
                        EdgeInsets.only(left: 91.w, top: 50.h, bottom: 3.h),
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
                  Stack(
                    children: [
                      image == null
                          ? Center(
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
                            )
                          : Center(
                              child: SizedBox(
                                width: 270.w,
                                height: 270.h,
                                child: Image.file(
                                  File(image!.path),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                      Center(
                        child: MaterialButton(
                            onPressed: () async {
                              await getImage(ImageSource.gallery);
                              print(image!.path);
                            },
                            child: SizedBox(width: 270.w, height: 270.h)),
                      )
                    ],
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 10.h),
                      child: Text(
                        '프로필 이미지를 설정하지 않을 경우에는 기본 프로필로 설정됩니다.',
                        style: TextStyle(
                          color: const Color(0xFFFF0000),
                          fontSize: 8.sp,
                          fontFamily: 'NotoSansKR',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Column(
                      children: [
                        ///회원가입 버튼
                        Padding(
                          padding: EdgeInsets.only(top: 50.h),
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
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
