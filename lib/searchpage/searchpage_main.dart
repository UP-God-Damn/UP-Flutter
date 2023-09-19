import 'package:flutter/material.dart';

import 'package:up/mainscreen/floatingbutton.dart';
import 'package:up/mainscreen/drawer.dart';
import 'package:up/searchpage/search_page_appbar.dart';
import 'package:up/searchpage/searchpage_body.dart';

class SearchPage extends StatefulWidget {
  final String title, state, major;

  const SearchPage(
      {required this.title,
      required this.state,
      required this.major,
      super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F3F3),
      appBar: searchPageAppbar(context),
      body: SearchPageBody(
          title: widget.title, state: widget.state, major: widget.major),
      floatingActionButton: pancilButton(context),
      drawer: const MainDrawer(),
    );
  }
}
