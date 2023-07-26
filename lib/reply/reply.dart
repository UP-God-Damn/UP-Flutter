import 'package:flutter/material.dart';
import 'package:up/reply/replyappbar.dart';
import 'package:up/reply/replybody.dart';

class Reply extends StatelessWidget {
  const Reply({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F3F3),
      appBar: replyAppbar(context),
      body: replyBody(context),
    );
  }
}
