import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class SignUpDropdown extends StatefulWidget {
  const SignUpDropdown({super.key});

  @override
  State<SignUpDropdown> createState() => _SignUpDropdownState();
}

class _SignUpDropdownState extends State<SignUpDropdown> {
  final List<String> major = ['프론트엔드', '백엔드', 'AOS', 'IOS', 'Flutter', '임베디드'];
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        isExpanded: true,
        hint: Text(
          //hintText
          '전공을 선택해주세요',
          style: TextStyle(
            fontSize: 14,
            color: Theme.of(context).hintColor,
          ),
        ),
        items: major
            .map((String item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: const TextStyle(
                      fontSize: 14,
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
