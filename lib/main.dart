import 'package:flutter/material.dart';
import 'package:up/provider/userId_provider.dart';

import 'Sign in and Sign up/choose.dart';
import 'provider/error_provider.dart';
import 'package:up/provider/comment_provider.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';

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
      ],
      child: ScreenUtilInit(
        designSize: const Size(430, 932),
        builder: (context, child) {
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: SafeArea(child: Choose()),
          );
        },
      ),
    );
  }
}
