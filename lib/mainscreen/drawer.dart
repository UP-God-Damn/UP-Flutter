import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:image_picker/image_picker.dart';

import 'package:up/viewdetails/detailssaffold.dart';
import 'package:up/model/postUserList.dart';
import 'package:up/model/userProfile.dart';
import 'package:up/url.dart';

Future<PostUserList> getList() async {
  ///URL
  var url = '$baseUrl/post/user?page=0&size=100';
  const storage = FlutterSecureStorage();
  final token = await storage.read(key: 'accessToken');
  final response = await http.get(
    Uri.parse(url),
    headers: <String, String>{HttpHeaders.authorizationHeader: 'Bearer $token'},
  );
  if (response.statusCode == 200) {
    return PostUserList.fromJson(jsonDecode(
      utf8.decode(response.bodyBytes),
    )); //utf8.decode(response.bodyBytes);
  } else {
    throw Exception(response.body);
  }
}

Future<UserProfile> getProfile() async {
  ///URL
  var url = '$baseUrl/user';
  const storage = FlutterSecureStorage();
  final token = await storage.read(key: 'accessToken');
  final response = await http.get(
    Uri.parse(url),
    headers: <String, String>{HttpHeaders.authorizationHeader: 'Bearer $token'},
  );
  if (response.statusCode == 200) {
    return UserProfile.fromJson(jsonDecode(
        utf8.decode(response.bodyBytes))); //utf8.decode(response.bodyBytes);
  } else {
    throw Exception(response.body);
  }
}

void postImage(image, String accountId) async {
  Dio dio = Dio();
  const storage = FlutterSecureStorage();
  final token = await storage.read(key: 'accessToken');

  dio.options.contentType = 'multipart/form-data';
  dio.options.headers["Authorization"] = "Bearer $token";

  String imagePath = image.path;

  print('${image.path}------$accountId');

  String url = "$baseUrl/user/profileImage/$accountId";

  try {
    FormData formData = FormData.fromMap({
      "image": await MultipartFile.fromFile(imagePath),
    });

    Response response = await dio.post(url, data: formData);

    if (response.statusCode == 201) {
      print('이미지 업로드 성공');
      print('서버 응답: ${response.data}');
    } else {
      print('이미지 업로드 실패 ${response.data}');
    }
  } catch (e) {
    print('오류 발생: $e');
  }
}

class MainDrawer extends StatefulWidget {
  const MainDrawer({super.key});

  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  Future<PostUserList>? userList;
  Future<UserProfile>? userProfile;

  XFile? image;
  final ImagePicker picker = ImagePicker();

  @override
  void initState() {
    userProfile = getProfile();
    userList = getList();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final key = widget.key;

    Future<void> getImage(ImageSource imageSource) async {
      final pickedFile =
          await picker.pickImage(source: imageSource, imageQuality: 100);
      setState(() {
        image = XFile(pickedFile!.path);
      });
    }

    return Drawer(
      backgroundColor: const Color(0xFFE8E8E8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 220.h,
            child: FutureBuilder(
              future: userProfile,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final String nickname = snapshot.data!.nickname.toString();
                  final String userId = snapshot.data!.accountId.toString();
                  final String userImage =
                      snapshot.data!.profileImgeUrl.toString();

                  return Container(
                    width: double.infinity,
                    height: 220.h,
                    color: Colors.white,
                    child: Row(
                      children: [
                        Column(
                          children: [
                            /// 프로필 사진
                            Padding(
                              padding: EdgeInsets.only(top: 110.h, left: 27.w),
                              child: GestureDetector(
                                onTap: () async {
                                  await getImage(ImageSource.gallery);
                                  postImage(image, userId);
                                },
                                child: SizedBox(
                                  width: 72.w,
                                  height: 72.w,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100000),
                                    child: Image.network(
                                      userImage,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

                        /// 유저 아이디, 닉네임
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 12.w, top: 129.h),
                              child: SizedBox(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    /// user nickname
                                    Text(
                                      nickname,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15.sp,
                                        fontFamily: 'NotoSansKR',
                                        color: Colors.black,
                                      ),
                                    ),

                                    /// userId
                                    Text(
                                      userId,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 9.sp,
                                        fontFamily: 'NotoSansKR',
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text(snapshot.hasError.toString());
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),

          /// 위 배경

          //
          //
          ListTile(
            tileColor: const Color(0xFFF3F3F3),
            leading: const Icon(
              Icons.turned_in,
              color: Color(0xFF191C1B),
            ),
            title: Text(
              '작성한 글',
              style: TextStyle(
                color: const Color(0xFF191C1B),
                fontFamily: 'NotoSansKR',
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
                letterSpacing: -0.41,
              ),
            ),
          ),
          Container(color: Colors.black, height: 1.h), //선
          Expanded(
            child: FutureBuilder(
              future: userList,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: snapshot.data!.postResponses!.length,
                    itemBuilder: (context, index) {
                      final String id =
                          snapshot.data!.postResponses![index].id.toString();
                      final String title =
                          snapshot.data!.postResponses![index].title.toString();
                      final String tag =
                          snapshot.data!.postResponses![index].state.toString();

                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Details(
                                index: index,
                                id: id,
                                key: key,
                              ),
                            ),
                          );
                        },
                        child: ListTile(
                          tileColor: const Color(0xFFF3F3F3),
                          title: SingleChildScrollView(
                            reverse: false,
                            child: Text(
                              title,
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontFamily: 'NotoSansKR',
                                color: Colors.black,
                              ),
                            ),
                          ),
                          leading: Padding(
                            padding: EdgeInsets.only(left: 11.w),
                            child: Icon(
                              tag == '해결' ? Icons.check_circle : Icons.error,
                              color: tag == '질문'
                                  ? const Color(0xFFDA6156)
                                  : const Color(0xFF7DB45A),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Text(snapshot.hasError.toString());
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
