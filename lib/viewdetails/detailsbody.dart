import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:up/reply/reply.dart';
import 'package:up/modify/modefy.dart';

SingleChildScrollView detailsBody(
    tag, major, contant, reply, context, day, key) {
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
                          tag,
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
                child: Text(
                  contant,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.sp,
                    fontFamily: 'NotoSansKR',
                    fontWeight: FontWeight.w500,
                  ),
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
              Padding(
                padding: EdgeInsets.only(right: 18.w),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Modefy(),
                        ));
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
              ),

              /// 삭제
              Row(
                children: [
                  const Icon(Icons.delete, color: Colors.red),
                  SizedBox(width: 4.w),
                  const Text('삭제', style: TextStyle(color: Colors.red))
                ],
              ),
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
              ClipRRect(
                borderRadius: BorderRadius.circular(1000),
                child: Image.asset("assets/img/Logo.png", width: 50.w),
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
                            '작성일 : 2023 / 07 / 16',
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
                      '이재영',
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
                    builder: (context) =>
                        CommentDetails(reply: reply, key: key)));
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
