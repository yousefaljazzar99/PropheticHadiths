import 'package:alnawawiforty/utils/colors.dart';
import 'package:flutter/material.dart';

abstract class TextApp {
  static const Text splashScreen = const Text(
    "الاربعون النووية",
    style: TextStyle(
        color: colorApp.green1, fontWeight: FontWeight.bold, fontSize: 36),
  );

  static const Text topHomeScreen = const Text(
    "الاربعون النووية",
    textDirection: TextDirection.rtl,
    style: TextStyle(
        color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24),
  );
  static const Text headerHomeScreen = const Text(
    "لحفظ وسماع الاحاديث النووية",
    style: TextStyle(
        color: Colors.green, fontWeight: FontWeight.bold, fontSize: 24),
  );

  static const Text bookOneScreen = const Text("الأحاديث الاربعون",
      style: TextStyle(
          color: Colors.green, fontWeight: FontWeight.bold, fontSize: 30));
  static const Text bookTwoScreen = const Text("الاستماع للأحاديث",
      style: TextStyle(
          color: Colors.green, fontWeight: FontWeight.bold, fontSize: 30));
  static const Text bookThreeScreen = const Text("الأحاديث المحفوظه",
      style: TextStyle(
          color: Colors.green, fontWeight: FontWeight.bold, fontSize: 30));
}
