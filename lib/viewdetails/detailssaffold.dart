import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:up/viewdetails/detailsappbar.dart';
import 'package:up/viewdetails/detailsbody.dart';
import 'package:up/url.dart';

import 'package:up/model/userDetails.dart';

class Details extends StatefulWidget {
  final int id;

  const Details({required this.id, super.key});

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
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  Future<UserDetails>? getUserDetails;

  @override
  void initState() {
    super.initState();
    getUserDetails = widget.getDetails();
  }

  @override
  Widget build(BuildContext context) {
    final id = widget.id;

    return FutureBuilder(
      future: getUserDetails,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final String title = snapshot.data!.title.toString();
          final String tag = snapshot.data!.state.toString();
          final String nickname = snapshot.data!.userNickname.toString();
          final String profileImage = snapshot.data!.profileImage.toString();
          final String language = snapshot.data!.language.toString();
          final String major = snapshot.data!.major.toString();
          final String day = snapshot.data!.createDate.toString();
          final String content = snapshot.data!.content.toString();
          final String userId = snapshot.data!.accountId.toString();
          final String file = snapshot.data!.file.toString(); // Details 내 이미지

          return Scaffold(
            appBar: detailsAppbar(title, context),
            body: DetailsBody(
              id: id,
              tag: tag,
              major: major,
              language: language,
              content: content,
              day: day,
              nickname: nickname,
              profileImage: profileImage,
              file: file,
              userId: userId,
              title: title,
            ),
          );
        } else if (snapshot.hasError) {
          return Text(snapshot.hasError.toString());
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
