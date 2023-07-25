import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:up/widget/majorDropdown.dart';
import 'package:up/widget/errorDropdown.dart';
import 'package:up/widget/mainlist.dart';

Column mainPageBody() {
  return Column(
    children: [
      Padding(
        padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 29.64.h),
        child: Container(
          width: 390.w,
          height: 45.h,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: const Color(0xFFABABAB)),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 16.w),
            child: const TextField(
              decoration: InputDecoration(
                hintText: '제목을 입력해주세요',
                border: InputBorder.none,
                suffixIcon: Icon(Icons.search),
              ),
            ),
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(top: 7.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: 89.w,
              height: 25.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(7)),
                border: Border.all(color: const Color(0xFFABABAB)),
              ),
              child: const ErrorDropdown(),
            ),
            Padding(
              padding: EdgeInsets.only(right: 20.w, left: 6.w),
              child: Container(
                width: 89.w,
                height: 25.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(7)),
                  border: Border.all(color: const Color(0xFFABABAB)),
                ),
                child: const MajorDropdown(),
              ),
            ),
          ],
        ),
      ),
      Expanded(
        child: Padding(
          padding: EdgeInsets.only(top: 32.h),
          child: ListView.builder(
            itemCount: mainList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(right: 20.w, left: 20.w, bottom: 10.h),
                child: Container(
                  width: 390.w,
                  height: 95.h,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 20.h),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 16.w),
                              child: Container(
                                width: 44.w,
                                height: 15.h,
                                decoration: BoxDecoration(
                                  color: mainList[index]['tag'] == true
                                      ? const Color(0xFF7DB45A)
                                      : const Color(0xFFDA6156),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                ),
                                child: Center(
                                  child: Text(
                                    mainList[index]['tag'] == true
                                        ? '해결'
                                        : '질문',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 9.sp,
                                      fontFamily: 'NotoSansKR',
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 9.w),
                              child: Text(
                                mainList[index]['title'],
                                style: TextStyle(
                                  fontSize: 17.sp,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 16.w, top: 3.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              mainList[index]['name'],
                              style: TextStyle(
                                fontSize: 9.sp,
                                fontFamily: 'NotoSansKR',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              mainList[index]['major'],
                              style: TextStyle(
                                fontSize: 9.sp,
                                fontFamily: 'NotoSansKR',
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 14.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              mainList[index]['day'],
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 8.sp,
                                fontWeight: FontWeight.w100,
                              ),
                            ),
                          ],
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
