import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:up/widget/mainlist.dart';

Column detailsBody(tag, major, contant, reply) {
  return Column(
    children: [
      Padding(
        padding: EdgeInsets.fromLTRB(20.w, 31.64.h, 20.w, 9.h),
        child: Row(
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
            const Expanded(child: SizedBox(width: double.infinity)),
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
        padding: EdgeInsets.only(left: 20.w),
        child: Expanded(
          child: SizedBox(
            width: double.infinity,
            child: Text(
              '댓글',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                fontFamily: 'NotoSansKR',
              ),
            ),
          ),
        ),
      ),
      Expanded(
        child: Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w),
          child: ListView.builder(
            itemCount: contantList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(top: 10.h),
                child: Container(
                  width: 390.w,
                  height: 72.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    border: Border.all(color: const Color(0xFFABABAB)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.only(left: 15.w, top: 14.h, bottom: 2.h),
                        child: Text(
                          '이재영',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontFamily: 'NotoSansKR',
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: 15.w, right: 15.w),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Text(
                              reply,
                              style: TextStyle(
                                fontSize: 17.sp,
                                fontFamily: 'NotoSansKR',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      )
    ],
  );
}
