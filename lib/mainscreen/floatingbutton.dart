import 'package:flutter/material.dart';
import 'package:up/create/create.dart';

FloatingActionButton pancilButton(context) {
  return FloatingActionButton(
    backgroundColor: const Color(0xFFD9D9D9),
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const Create(),
        ),
      );
    },
    child: const Icon(
      Icons.mode,
      color: Colors.black,
    ),
  );
}
