import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'package:up/provider/error_provider.dart';

class ErrorDropdown extends StatefulWidget {
  const ErrorDropdown({super.key});

  @override
  State<ErrorDropdown> createState() => _ErrorDropdownState();
}

class _ErrorDropdownState extends State<ErrorDropdown> {
  final List<String> major = ['오류', '해결'];

  @override
  Widget build(BuildContext context) {
    var errorController = Provider.of<ErrorController>(context);

    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        isExpanded: true,
        iconStyleData: IconStyleData(iconSize: 16.w),
        items: major
            .map((String item) => DropdownMenuItem<String>(
                  value: item,
                  child: Center(
                    child: Text(
                      item,
                      style: TextStyle(
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                ))
            .toList(),
        value: errorController.issueState,
        onChanged: (dynamic value) {
          errorController.outcomeCategory(value);
        },
        buttonStyleData: ButtonStyleData(
          padding: EdgeInsets.only(right: 6.w),
          height: 40.h, //40
          width: 140.w, //140
        ),
        menuItemStyleData: MenuItemStyleData(
          padding: EdgeInsets.only(left: 20.w),
          height: 40.h,
        ),
      ),
    );
  }
}
