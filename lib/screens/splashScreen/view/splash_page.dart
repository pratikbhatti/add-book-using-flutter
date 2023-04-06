import 'dart:async';

import 'package:demo48/screens/homeScreen/view/home_page.dart';
import 'package:demo48/screens/login/view/login_page.dart';
import 'package:demo48/utility/helpers/firebase_helper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    checkUser();
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Lottie.asset(
            'assets/json/splash_screen.json',
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }

  void checkUser() {
    bool isLogin = Firebase_helper.firebase_helper.checkLogin();
    if (isLogin) {
      Timer(Duration(seconds: 3), () {
        Get.off(HomePage());
      });
    } else {
      Timer(Duration(seconds: 3), () {
        Get.off(LoginPage());
      });
    }
  }
}
