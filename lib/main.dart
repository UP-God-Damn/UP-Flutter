import 'package:flutter/material.dart';
import 'package:up/provider/post_id_provider.dart';
import 'package:up/provider/userId_provider.dart';

import 'Sign in and Sign up/choose.dart';
import 'provider/error_provider.dart';
import 'package:up/provider/comment_provider.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart'; // 가로 회전 막기

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ErrorController()),
        ChangeNotifierProvider(create: (context) => MajorController()),
        ChangeNotifierProvider(create: (context) => CommentController()),
        ChangeNotifierProvider(create: (context) => UserIdControllder()),
        ChangeNotifierProvider(create: (context) => PostIdController()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(430, 932),
        builder: (context, child) {
          SystemChrome.setPreferredOrientations(
              [DeviceOrientation.portraitUp]); //가로 회전 막기
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: SafeArea(child: Choose()),
          );
        },
      ),
    );
  }
}
