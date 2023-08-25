import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:up/widget/mainlist.dart';

class Reply extends StatelessWidget {
  final String reply;

  const Reply({
    required this.reply,
    required Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final commentController = TextEditingController();

    return Scaffold(
      backgroundColor: const Color(0xFFF3F3F3),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF3F3F3),
        centerTitle: false,
        elevation: 1,
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
          '돌아가기',
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
      bottomNavigationBar: Padding(
          padding: EdgeInsets.only(bottom: 40.h),
          child: SizedBox(
            width: 430.w,
            height: 50.h,
            child: Padding(
              padding: EdgeInsets.only(left: 20.w),
              child: TextField(
                controller: commentController,
                maxLines: 1000,
                decoration: const InputDecoration(
                  hintText: '댓글을 작성해 주세요',
                  border: InputBorder.none,
                ),
              ),
            ),
          )),
      //
      //
      //
      body: Padding(
        padding: EdgeInsets.fromLTRB(20.w, 30.h, 20.w, 0.h),
        child: ListView.builder(
          itemCount: contantList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(top: 5.h, bottom: 5.h),
              child: Container(
                /// 둘러싼 Container
                decoration: BoxDecoration(
                  color: const Color(0xFFDCDCDC),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 13.w, top: 16.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(right: 3.w),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(1000),
                                  child: Image.asset(
                                    'assets/img/Logo.png',
                                    width: 19.w,
                                    height: 19.h,
                                  ),
                                ),
                              ),
                              Text(mainList[index]['name']),
                              SizedBox(width: 15.w),
                              Text(
                                '2023 /07 /23',
                                style: TextStyle(
                                  color: const Color(0xFF767676),
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'NotoSansKR',
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 20.w, right: 20.w, top: 8.h, bottom: 10.h),
                      child: Text(reply),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
