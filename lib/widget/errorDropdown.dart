import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ErrorDropdown extends StatefulWidget {
  const ErrorDropdown({super.key});

  @override
  State<ErrorDropdown> createState() => _ErrorDropdownState();
}

class _ErrorDropdownState extends State<ErrorDropdown> {
  final List<String> major = ['오류', '해결'];
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        //isExpanded: true,
        iconStyleData: IconStyleData(iconSize: 15.w),
        hint: Text(
          '오류/해결',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'NotoSansKR',
            fontSize: 9.sp,
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
