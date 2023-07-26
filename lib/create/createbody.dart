import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:up/widget/errorDropdown.dart';
import 'package:up/widget/majorDropdown.dart';

SingleChildScrollView createBody(context) {
  final titleController = TextEditingController();
  final contentController = TextEditingController();

  return SingleChildScrollView(
    physics: const BouncingScrollPhysics(),
    child: Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(20.w, 31.64.h, 20.w, 6.h),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 7.w),
                child: Text(
                  '제목',
                  style: TextStyle(
                    fontSize: 20.sp,
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
                  child: const ErrorDropdown(),
                ),
              ),
              Container(
                width: 89.w,
                height: 25.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(7)),
                  border: Border.all(color: const Color(0xFFABABAB)),
                ),
                child: const MajorDropdown(),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 10.h),
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
        Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 7.w),
                child: Text(
                  '내용',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'NotoSansKR',
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 50.w),
                child: Text(
                  '※해결 전 코드 → 해결 방법 → 완성된 코드 순으로 적어주세요',
                  style: TextStyle(
                    fontSize: 10.sp,
                    fontFamily: 'NotoSansKR',
                    fontWeight: FontWeight.w200,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 14.h),
          child: Container(
            width: 390.w,
            height: 560.h,
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
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
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
                '글 올리기',
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
  );
}
