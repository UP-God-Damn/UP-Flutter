// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import 'package:up/model/userDetails.dart';
import 'package:up/url.dart';

enum SampleItem { modify, del }

Future postComment(id, comment) async {
  final url = '$baseUrl/comment';
  const storage = FlutterSecureStorage();
  final token = await storage.read(key: 'accessToken');
  final response = await http.post(
    Uri.parse(url),
    headers: {
      'Content-Type': 'application/json',
      HttpHeaders.authorizationHeader: 'Bearer $token',
    },
    body: jsonEncode({
      "id": id,
      "content": comment,
    }),
  );

  if (response.statusCode != 201) {
    throw Exception(response.body);
  }
}

class CommentDetails extends StatefulWidget {
  final String id;

  const CommentDetails({required this.id, super.key});

  Future<UserDetails> getDetails() async {
    ///URL
    final url = '$baseUrl/post/$id';
    const storage = FlutterSecureStorage();
    final token = await storage.read(key: 'accessToken');
    final response = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        HttpHeaders.authorizationHeader: 'Bearer $token'
      },
    );
    if (response.statusCode == 200) {
      return UserDetails.fromJson(jsonDecode(
          utf8.decode(response.bodyBytes))); //utf8.decode(response.bodyBytes);
    } else {
      throw Exception(response.body);
    }
  }

  @override
  State<CommentDetails> createState() => _CommentDetailsState();
}

class _CommentDetailsState extends State<CommentDetails> {
  Future<UserDetails>? userDetails;

  @override
  void initState() {
    userDetails = widget.getDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final commentTextController = TextEditingController();
    SampleItem? selectedMenu;

    final id = widget.id;

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
        body: FutureBuilder(
          future: userDetails,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20.w, 30.h, 20.w, 0.h),
                      child: ListView.builder(
                        itemCount: snapshot.data!.comments!.length,
                        itemBuilder: (context, index) {
                          final String userProfile = snapshot
                              .data!.comments![index].profileImage
                              .toString();

                          final String userNickname = snapshot
                              .data!.comments![index].userNickname
                              .toString();

                          final String day = snapshot
                              .data!.comments![index].createDate
                              .toString();

                          final String comment = snapshot
                              .data!.comments![index].content
                              .toString();

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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      /// 작성자이름, 작성일
                                      Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 13.w, top: 16.h),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                /// 프로필 사진
                                                Row(
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          right: 3.w),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(1000),
                                                        child: Image.network(
                                                          userProfile,
                                                          width: 19.w,
                                                          height: 19.h,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),

                                                    /// 프로필 이름
                                                    Text(userNickname),
                                                    SizedBox(width: 15.w),

                                                    /// 작성일
                                                    Text(
                                                      day,
                                                      style: TextStyle(
                                                        color: const Color(
                                                            0xFF767676),
                                                        fontSize: 10.sp,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontFamily:
                                                            'NotoSansKR',
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
                                            MenuController controller,
                                            Widget? child) {
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
                                        menuChildren:
                                            List<MenuItemButton>.generate(
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
                                    child: Text(comment),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 120.h,
                    decoration: BoxDecoration(
                        border: Border(
                            top: BorderSide(
                      width: 1.h,
                      color: Colors.black,
                    ))),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.only(left: 20.w),
                        child: TextField(
                          controller: commentTextController,
                          maxLines: 1000,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              padding: EdgeInsets.only(
                                  bottom: double.infinity, top: 10.h),
                              onPressed: () async {
                                if (commentTextController.text.length < 5) {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: const Text('댓글이 생성되지 않았습니다.'),
                                        content: const Text('글자수 제한(5글자 이하)'),
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
                                } else if (commentTextController.text.length >
                                    5000) {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: const Text('댓글이 생성되지 않았습니다.'),
                                        content:
                                            const Text('글자수 제한(5000글자 이상)'),
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
                                } else {
                                  postComment(id, commentTextController.text);
                                  await showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: const Text('댓글이 생성되었습니다'),
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
                                  Navigator.pop(context);
                                }
                              },
                              icon: const Icon(Icons.send),
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
              );
            } else if (snapshot.hasError) {
              return Text(snapshot.hasError.toString());
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ));
  }
}
