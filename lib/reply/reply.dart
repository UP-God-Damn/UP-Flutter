import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:up/widget/mainlist.dart';

enum SampleItem { modify, del }

class CommentDetails extends StatefulWidget {
  final String reply;

  const CommentDetails({
    required this.reply,
    required Key? key,
  }) : super(key: key);

  @override
  State<CommentDetails> createState() => _CommentDetailsState();
}

class _CommentDetailsState extends State<CommentDetails> {
  @override
  Widget build(BuildContext context) {
    final commentController = TextEditingController();
    SampleItem? selectedMenu;

    final String reply = widget.reply;

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
      body: Column(
        children: [
          Expanded(
            child: Padding(
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              /// 작성자이름, 작성일
                              Row(
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: 13.w, top: 16.h),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        /// 프로필 사진
                                        Row(
                                          children: [
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(right: 3.w),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(1000),
                                                child: Image.asset(
                                                  'assets/img/Logo.png',
                                                  width: 19.w,
                                                  height: 19.h,
                                                ),
                                              ),
                                            ),

                                            /// 프로필 이름
                                            Text(mainList[index]['name']),
                                            SizedBox(width: 15.w),

                                            /// 작성일
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
                                ],
                              ),
                              //
                              //
                              //
                              /// 수정, 삭제 메뉴
                              MenuAnchor(
                                builder: (BuildContext context,
                                    MenuController controller, Widget? child) {
                                  return IconButton(
                                    onPressed: () {
                                      if (controller.isOpen) {
                                        controller.close();
                                      } else {
                                        controller.open();
                                      }
                                    },
                                    icon: const Icon(Icons.more_horiz),
                                    tooltip: 'Show menu',
                                  );
                                },
                                menuChildren: List<MenuItemButton>.generate(
                                  2,
                                  (int index) => MenuItemButton(
                                    onPressed: () {
                                      setState(() => selectedMenu =
                                          SampleItem.values[index]);
                                      print(index);
                                    },
                                    child: Text(
                                      index == 0 ? '수정' : '삭제',
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          //
                          //
                          //
                          /// 댓글
                          Padding(
                            padding: EdgeInsets.only(
                                left: 20.w,
                                right: 20.w,
                                top: 8.h,
                                bottom: 10.h),
                            child: Text(reply),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          SizedBox(
            width: 430.w,
            height: 60.h,
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(left: 20.w),
                child: TextField(
                  controller: commentController,
                  maxLines: 1000,
                  decoration: const InputDecoration(
                    suffixIcon: Icon(
                      Icons.send,
                      color: Colors.black,
                    ),
                    hintText: '댓글을 작성해 주세요',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
