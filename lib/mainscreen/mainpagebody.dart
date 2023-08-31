import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:up/viewdetails/detailssaffold.dart';

import 'package:up/widget/majorDropdown.dart';
import 'package:up/widget/errorDropdown.dart';
import 'package:up/widget/mainlist.dart';
import 'package:up/model/postMainList.dart';

Future<PostMainList> getList() async {
  var url =
      'http://13.209.66.252:8080/post/search?title=&state=&major=&page=0&size=3';
  const bearer = 'Bearer';
  final response = await http.get(
    Uri.parse(url),
    headers: <String, String>{
      HttpHeaders.authorizationHeader: '$bearer '
          'eyJ0eXAiOiJhY2Nlc3MiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJsanlvMm85IiwiZXhwIjoxNjkzNDUwOTYxfQ.fWPVLcYUflOn8IBtonPT2lp4kR5fxFWoXrl6qOPj21I'
    },
  );
  if (response.statusCode == 200) {
    return PostMainList.fromJson(jsonDecode(
        utf8.decode(response.bodyBytes))); //utf8.decode(response.bodyBytes);
  } else {
    throw Exception(response.body);
  }
}

class MainPageBody extends StatefulWidget {
  const MainPageBody({super.key});

  @override
  State<MainPageBody> createState() => _MainPageBodyState();
}

class _MainPageBodyState extends State<MainPageBody> {
  Future<PostMainList>? postList;

  @override
  void initState() {
    super.initState();
    postList = getList();
  }

  @override
  Widget build(BuildContext context) {
    final maintitleController = TextEditingController();
    final key = widget.key;

    return FutureBuilder(
        future: postList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                //
                //
                //
                ///제목을 입력해주세요 검색창
                Padding(
                  padding:
                      EdgeInsets.only(left: 20.w, right: 20.w, top: 29.64.h),
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
                          borderRadius:
                              const BorderRadius.all(Radius.circular(7)),
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
                            borderRadius:
                                const BorderRadius.all(Radius.circular(7)),
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
                      itemCount: snapshot.data!.postResponses!.length,
                      itemBuilder: (context, index) {
                        // "id": 2,
                        // "userNickname": "모시깽이",
                        // "profile": "http://up-image.s3-website.ap-northeast-2.amazonaws.com/b5362c9c-e08c-4a5d-abb4-f438ee7d88e5.jpg",
                        // "title": "오류아좀아고쳐주세요오류우좀우고쳐주세요오류아좀우",
                        // "state": "질문",
                        // "major": "백엔드",
                        // "language": "java",
                        // "createDate": "2023 / 08 / 30"
                        final String title = snapshot
                            .data!.postResponses![index].title
                            .toString();
                        final String tag = snapshot
                            .data!.postResponses![index].state
                            .toString();
                        final String day = snapshot
                            .data!.postResponses![index].createDate
                            .toString();
                        final String major = snapshot
                            .data!.postResponses![index].major
                            .toString();
                        final String name = snapshot
                            .data!.postResponses![index].userNickname
                            .toString();
                        final String language = snapshot
                            .data!.postResponses![index].language
                            .toString();
                        final String image = snapshot
                            .data!.postResponses![index].profile
                            .toString();
                        var contant = mainList[index]['contant'];
                        var reply = mainList[index]['reply'];

                        return Padding(
                          padding: EdgeInsets.only(
                              right: 20.w, left: 20.w, bottom: 10.h),
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            ///제목
                                            padding:
                                                EdgeInsets.only(left: 17.w),
                                            child: SizedBox(
                                              width: 300.w,
                                              child: Text(
                                                title,
                                                style: TextStyle(
                                                  fontSize: 17.sp,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle: FontStyle.normal,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            ///태그
                                            padding:
                                                EdgeInsets.only(right: 17.w),
                                            child: Container(
                                              width: 44.w,
                                              height: 15.h,
                                              decoration: BoxDecoration(
                                                color: tag == '해결'
                                                    ? const Color(0xFF7DB45A)
                                                    : const Color(0xFFDA6156),
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(10)),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  tag,
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
                                      padding:
                                          EdgeInsets.only(left: 17.w, top: 5.h),
                                      child: Row(
                                        children: [
                                          Image.asset("assets/img/Star.png"),
                                          SizedBox(width: 3.w),

                                          /// 전공
                                          Text(
                                            major,
                                            style: TextStyle(
                                              fontSize: 9.sp,
                                              fontFamily: 'NotoSansKR',
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          SizedBox(width: 10.w),
                                          Image.asset("assets/img/World.png"),
                                          SizedBox(width: 3.w),

                                          /// 언어
                                          Text(
                                            language,
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
                                        /// 프로필 이미지
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 17.w, top: 8.w),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                                Checkbox.width),
                                            child: Image.network(
                                              image,
                                              width: 17.w,
                                              height: 17.h,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 4.w),
                                        Padding(
                                          padding: EdgeInsets.only(top: 10.h),

                                          /// 이름
                                          child: Text(
                                            name,
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          /// 제작 날짜
                                          Text(
                                            day,
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
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else
            // ignore: curly_braces_in_flow_control_structures
            return const Center(
                child: CircularProgressIndicator()); // 로딩 인디케이터 표시
        });
  }
}
