import 'package:demo48/screens/homeScreen/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

HomeController homeController = Get.put(HomeController());

class ColorStyle {
  static Color white = Colors.white;
  static Color dark_Orange = Color.fromARGB(255, 255, 136, 34);
  static Color light_Orange = Color.fromARGB(255, 255, 177, 41);
  static Color blueColorCode = Color(0xFF2661FA);
  static Color red = Colors.red;
  static Color green = Colors.lightGreen;
  static Color black = Colors.black;
  static Color greyShade300 = Colors.grey.shade300;
  static Color greyShade500 = Colors.grey.shade500;
  static Color grey = Colors.grey;
  static Color greyShade700 = Colors.grey.shade700;
}
