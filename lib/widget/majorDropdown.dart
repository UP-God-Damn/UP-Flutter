import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'package:up/provider/error_provider.dart';

class MajorDropdown extends StatefulWidget {
  const MajorDropdown({super.key});

  @override
  State<MajorDropdown> createState() => _MajorDropdownState();
}

class _MajorDropdownState extends State<MajorDropdown> {
  //BACKEND(백엔드), FRONTEND(프론트), ANDROID(안드로이드), FLUTTER(플러터), IOS, DEVOPS, EMBEDDED(임베디드)

  final List<String> major = [
    'FRONTEND',
    'BACKEND',
    'AOS',
    'IOS',
    'FLUTTER',
    'DEVOPS',
    'EMBEDDED',
  ];

  @override
  Widget build(BuildContext context) {
    var majorController = Provider.of<MajorController>(context);

    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        isExpanded: true,
        iconStyleData: IconStyleData(iconSize: 15.w),
        items: major
            .map((String item) => DropdownMenuItem<String>(
                  value: item,
                  child: Center(
                    child: Text(
                      item,
                      style: TextStyle(
                        fontSize: 10.sp,
                      ),
                    ),
                  ),
                ))
            .toList(),
        value: majorController.majorState,
        onChanged: (dynamic value) {
          majorController.majorCategory(value);
        },
        buttonStyleData: ButtonStyleData(
          padding: EdgeInsets.only(right: 10.w),
          height: 40,
          width: 140,
        ),
        menuItemStyleData: const MenuItemStyleData(
          height: 40,
        ),
      ),
    );
  }
}
