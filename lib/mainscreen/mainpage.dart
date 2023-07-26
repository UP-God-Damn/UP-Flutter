import 'package:flutter/material.dart';

import 'package:up/mainscreen/drawer.dart';
import 'package:up/mainscreen/mainpageappbar.dart';
import 'package:up/mainscreen/mainpagebody.dart';
import 'package:up/mainscreen/floatingbutton.dart';

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
      appBar: mainPageAppbar(context),
      body: const MainPageBody(),
      floatingActionButton: pancilButton(context),
      drawer: const MainDrawer(),
    );
  }
}
