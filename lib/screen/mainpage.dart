import 'package:flutter/material.dart';

import 'package:up/screen/mainpageappbar.dart';
import 'package:up/screen/mainpagebody.dart';
import 'package:up/screen/floatingbutton.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F3F3),
      appBar: mainPageAppbar(),
      body: mainPageBody(),
      floatingActionButton: pancilButton(context),
    );
  }
}
