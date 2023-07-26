import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:up/widget/mainlist.dart';

import 'package:up/reply/reply.dart';

Column detailsBody(tag, major, contant, reply, context) {
  return Column(
    children: [
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
                Padding(
                  padding: EdgeInsets.only(right: 6.w),
                  child: Container(
                    width: 89.w,
                    height: 25.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(Radius.circular(7)),
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
                Padding(
                  padding: EdgeInsets.only(right: 6.w),
                  child: Container(
                    width: 89.w,
                    height: 25.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(Radius.circular(7)),
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
      Padding(
        padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 25.h),
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
      Padding(
        padding: EdgeInsets.only(left: 20.w, right: 20.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '댓글',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                fontFamily: 'NotoSansKR',
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Reply(),
                    ));
              },
              child: Text(
                '댓글 쓰러가기>',
                style: TextStyle(
                  color: const Color(0xFF767676),
                  fontSize: 12.sp,
                ),
              ),
            )
          ],
        ),
      ),
      SizedBox(height: 10.h),
      Expanded(
        child: Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w),
          child: ListView.builder(
            itemCount: contantList.length,
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Divider(
                    color: Color(0xFF555656),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5.h, bottom: 5.h),
                    child: Text(
                      reply,
                      style: TextStyle(
                        fontSize: 17.sp,
                        fontFamily: 'NotoSansKR',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    ],
  );
}
