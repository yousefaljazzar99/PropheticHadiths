import 'package:alnawawiforty/utils/Strings.dart';
import 'package:alnawawiforty/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'AhadithScreen.dart';
import 'AudioAhadith.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        SvgPicture.asset(
          "assets/svg/iPhone X, XS, 11 Pro – 9.svg",
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Column(
          children: [
            SizedBox(
              height: 100,
            ),
            SvgPicture.asset("assets/svg/11.svg"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextApp.topHomeScreen,
                  TextApp.headerHomeScreen,
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (ctx) => AhadithScreen()));
                      },
                      child: myCard(
                          colorApp.green1,
                          colorApp.green2,
                          "الاحاديث الاربعين",
                          "assets/quran.png",
                          'assets/svg/one.svg')),
                  InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (ctx) => AudioAhadithScreen()));
                      },
                      child: myCard(
                          colorApp.yellow1,
                          colorApp.red2,
                          "الاستماع للاحاديث",
                          "assets/play.png",
                          'assets/svg/twoo.svg')),
                  myCard(colorApp.red1, colorApp.red2, "الاحاديث المحفوظه",
                      "assets/save-instagram.png", "assets/svg/three.svg")
                ],
              ),
            ),
          ],
        )
      ],
    ));
  }
}

Widget myCard(
  Color color1,
  color2,
  String text,
  path1,
  path2,
) {
  return Padding(
    padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
    child: Container(
        height: 100,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.black26, offset: Offset(10, 10), blurRadius: 40)
            ],
            borderRadius: BorderRadius.circular(8),
            gradient: LinearGradient(
                colors: [
                  color1,
                  color2,
                ],
                begin: AlignmentDirectional.topEnd,
                end: AlignmentDirectional.bottomStart)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              path1,
              height: 56,
              width: 56,
            ),
            Text(
              text,
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            SvgPicture.asset(path2)
          ],
        )),
  );
}
