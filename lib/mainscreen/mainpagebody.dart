import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:up/viewdetails/detailssaffold.dart';

import 'package:up/widget/majorDropdown.dart';
import 'package:up/widget/errorDropdown.dart';
import 'package:up/widget/mainlist.dart';

class MainPageBody extends StatelessWidget {
  const MainPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    final maintitleController = TextEditingController();

    return Column(
      children: [
        //
        //
        //
        ///제목을 입력해주세요 검색창
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
              child: TextField(
                controller: maintitleController,
                decoration: const InputDecoration(
                  hintText: '제목을 입력해주세요',
                  border: InputBorder.none,
                  suffixIcon: Icon(Icons.search),
                ),
              ),
            ),
          ),
        ),
        //
        //
        /// 오류/해결 드롭다운
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
              //
              //
              //
              /// 전공 선택 드롭다운
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
        //
        //
        //
        ///ListView
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(top: 32.h),
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: mainList.length,
              itemBuilder: (context, index) {
                String title = mainList[index]['title'],
                    tag = mainList[index]['tag'] ? '해결' : '오류',
                    major = mainList[index]['major'],
                    day = mainList[index]['day'],
                    contant = contantList[index]['contant'],
                    reply = contantList[index]['reply'];

                return Padding(
                  padding:
                      EdgeInsets.only(right: 20.w, left: 20.w, bottom: 10.h),
                  child: GestureDetector(
                    /// 누르면 화면 들어감
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Details(
                            title: title,
                            tag: tag,
                            major: major,
                            day: day,
                            contant: contant,
                            reply: reply,
                            key: key,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      /// 주위 감싸는 컨테이너
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 5.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 20.h),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    ///제목
                                    padding: EdgeInsets.only(left: 17.w),
                                    child: Text(
                                      mainList[index]['title'],
                                      style: TextStyle(
                                        fontSize: 17.sp,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.normal,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    ///태그
                                    padding: EdgeInsets.only(right: 17.w),
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
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 17.w, top: 3.h),
                              child: Row(
                                children: [
                                  Image.asset("assets/img/Star.png"),
                                  SizedBox(width: 3.w),
                                  Text(
                                    mainList[index]['major'],
                                    style: TextStyle(
                                      fontSize: 9.sp,
                                      fontFamily: 'NotoSansKR',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  SizedBox(width: 10.w),
                                  Image.asset("assets/img/World.png"),
                                  SizedBox(width: 3.w),
                                  Text(
                                    '다트',
                                    style: TextStyle(
                                      fontSize: 9.sp,
                                      fontFamily: 'NotoSansKR',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: 17.w, top: 8.w),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(1000),
                                    child: Image.asset(
                                      "assets/img/Logo.png",
                                      width: 17.w,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 4.w),
                                Padding(
                                  padding: EdgeInsets.only(top: 10.h),
                                  child: Text(
                                    mainList[index]['name'],
                                    style: TextStyle(
                                      fontSize: 9.sp,
                                      fontFamily: 'NotoSansKR',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
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
}
