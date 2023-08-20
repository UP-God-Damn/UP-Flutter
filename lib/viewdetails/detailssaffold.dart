import 'package:flutter/material.dart';

import 'package:up/viewdetails/detailsappbar.dart';
import 'package:up/viewdetails/detailsbody.dart';

class Details extends StatelessWidget {
  final String title, tag, major, contant, reply, day;

  const Details({
    required this.title,
    required this.tag,
    required this.major,
    required this.contant,
    required this.reply,
    required this.day,
    required Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: detailsAppbar(title, context),
      body: detailsBody(tag, major, contant, reply, context, day),
    );
  }
}
