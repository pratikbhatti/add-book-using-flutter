import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditController extends GetxController {
  TextEditingController edit_nametxt = TextEditingController();
  TextEditingController edit_imagetxt = TextEditingController();
  TextEditingController edit_authortxt = TextEditingController();
  TextEditingController edit_aboutauthortxt = TextEditingController();
  TextEditingController edit_aboutbooktxt = TextEditingController();
  TextEditingController edit_ratingtxt = TextEditingController();
  TextEditingController edit_yeartxt = TextEditingController();
  RxString UpdateId = "".obs;
}
