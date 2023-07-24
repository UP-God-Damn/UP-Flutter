import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MajorDropdown extends StatefulWidget {
  const MajorDropdown({super.key});

  @override
  State<MajorDropdown> createState() => _MajorDropdownState();
}

class _MajorDropdownState extends State<MajorDropdown> {
  final List<String> major = ['프론트엔드', '백엔드', 'AOS', 'IOS', 'Flutter', '임베디드'];
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        isExpanded: true,
        hint: Text(
          //hintText
          '전공',
          style: TextStyle(
            fontFamily: 'NotoSansKR',
            fontSize: 10.sp,
            color: Theme.of(context).hintColor,
          ),
        ),
        items: major
            .map((String item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: TextStyle(
                      fontSize: 12.sp,
                    ),
                  ),
                ))
            .toList(),
        value: selectedValue,
        onChanged: (String? value) {
          setState(() {
            selectedValue = value;
            print(value);
          });
        },
        buttonStyleData: const ButtonStyleData(
          padding: EdgeInsets.symmetric(horizontal: 16),
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
