import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:up/model/postLogin.dart';
import 'package:up/url.dart';

Future<LoginToken> refreshToken() async {
  const storage = FlutterSecureStorage();
  final token = await storage.read(key: 'refreshToken');

  var url = '$baseUrl/user/refresh';

  final response = await http.post(
    Uri.parse(url),
    headers: {
      'Refresh-Token': token.toString(),
    },
  );

  if (response.statusCode == 201) {
    final LoginToken loginToken =
        LoginToken.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
    await storage.write(key: 'accessToken', value: loginToken.accessToken);
    await storage.write(key: 'refreshToken', value: loginToken.refreshToken);
    return LoginToken.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
  } else {
    throw Exception(response.body);
  }
}
