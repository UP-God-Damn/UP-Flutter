import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:up/viewdetails/detailssaffold.dart';

import 'package:up/widget/mainlist.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFFE8E8E8),
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            margin: EdgeInsets.zero,
            arrowColor: Colors.white,
            accountName: Text(
              '닉네임 : 이재영',
              style: TextStyle(
                fontSize: 14.sp,
                fontFamily: 'NotoSansKR',
                color: Colors.black,
              ),
            ),
            accountEmail: Text(
              '전공 : 플러터',
              style: TextStyle(
                fontSize: 14.sp,
                fontFamily: 'NotoSansKR',
                color: Colors.black,
              ),
            ),
            currentAccountPicture: const CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: AssetImage('assets/img/Logo.png'),
            ),
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
          ),
          ListTile(
            tileColor: const Color(0xFFF3F3F3),
            leading: const Icon(
              Icons.lightbulb,
              color: Color(0xFF191C1B),
            ),
            title: Text(
              '내가 쓴 글 ↓↓↓',
              style: TextStyle(
                color: const Color(0xFF191C1B),
                fontFamily: 'NotoSansKR',
                fontSize: 14.sp,
                letterSpacing: -0.41,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: mainList.length,
              itemBuilder: (context, index) {
                String title = mainList[index]['title'],
                    tag = mainList[index]['tag'] ? '해결' : '오류',
                    major = mainList[index]['major'],
                    contant = contantList[index]['contant'],
                    reply = contantList[index]['reply'];

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Details(
                            title: title,
                            tag: tag,
                            major: major,
                            contant: contant,
                            reply: reply,
                            key: key),
                      ),
                    );
                  },
                  child: ListTile(
                    tileColor: const Color(0xFFF3F3F3),
                    title: Text(
                      mainList[index]['title'],
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontFamily: 'NotoSansKR',
                        color: Colors.black,
                      ),
                    ),
                    leading: Icon(
                      mainList[index]['tag'] == true
                          ? Icons.check_circle
                          : Icons.error,
                      color: const Color(0xFF191C1B),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
