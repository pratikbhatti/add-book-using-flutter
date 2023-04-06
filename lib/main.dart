import 'package:demo48/screens/adddata/view/addData_page.dart';
import 'package:demo48/screens/homeScreen/view/home_page.dart';
import 'package:demo48/screens/login/view/login_page.dart';
import 'package:demo48/screens/splashScreen/view/splash_page.dart';
import 'package:demo48/screens/viewdata/view/view_data_page.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    GetMaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    ),
  );
}
