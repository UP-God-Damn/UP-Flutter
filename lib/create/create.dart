import 'package:flutter/material.dart';
import 'package:up/create/createappbar.dart';
import 'package:up/create/createbody.dart';

class Create extends StatefulWidget {
  const Create({super.key});

  @override
  State<Create> createState() => _CreateState();
}

class _CreateState extends State<Create> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F3F3),
      appBar: createAppbar(context),
      body: createBody(context),
    );
  }
}
