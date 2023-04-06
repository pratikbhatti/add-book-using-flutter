import 'package:demo48/screens/adddata/controller/add_data_controller.dart';
import 'package:demo48/screens/homeScreen/view/home_page.dart';
import 'package:demo48/utility/constant/color_style.dart';
import 'package:demo48/utility/constant/constants.dart';
import 'package:demo48/utility/helpers/firebase_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class AddDataPage extends StatefulWidget {
  const AddDataPage({super.key});

  @override
  State<AddDataPage> createState() => _AddDataPageState();
}

class _AddDataPageState extends State<AddDataPage> {
  AddDataController addDataController = Get.put(AddDataController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Add Data"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextFormField(
                  controller: addDataController.add_nametxt,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    labelStyle: TextStyle(color: ColorStyle.grey),
                    hintText: 'Enter Book Name',
                    hintStyle: TextStyle(color: ColorStyle.grey),
                    prefixIcon: Icon(Icons.book),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: ColorStyle.grey),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    border: new OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                      borderSide: new BorderSide(color: ColorStyle.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                      borderSide: BorderSide(
                        width: 1,
                        color: ColorStyle.greyShade700,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: addDataController.add_imagetxt,
                  decoration: InputDecoration(
                    labelText: 'Image Link',
                    labelStyle: TextStyle(color: ColorStyle.grey),
                    hintText: 'Enter Image Link',
                    hintStyle: TextStyle(color: ColorStyle.grey),
                    prefixIcon: Icon(Icons.image),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: ColorStyle.grey),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    border: new OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                      borderSide: new BorderSide(color: ColorStyle.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                      borderSide: BorderSide(
                        width: 1,
                        color: ColorStyle.greyShade700,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: addDataController.add_authortxt,
                  decoration: InputDecoration(
                    labelText: 'Author Name',
                    labelStyle: TextStyle(color: ColorStyle.grey),
                    hintText: 'Enter Author Name',
                    hintStyle: TextStyle(color: ColorStyle.grey),
                    prefixIcon: Icon(Icons.person),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: ColorStyle.grey),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    border: new OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                      borderSide: new BorderSide(color: ColorStyle.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                      borderSide: BorderSide(
                        width: 1,
                        color: ColorStyle.greyShade700,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: addDataController.add_aboutauthortxt,
                  decoration: InputDecoration(
                    labelText: 'About Author',
                    labelStyle: TextStyle(color: ColorStyle.grey),
                    hintText: 'Enter About Author',
                    hintStyle: TextStyle(color: ColorStyle.grey),
                    prefixIcon: Icon(Icons.edit),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: ColorStyle.grey),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    border: new OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                      borderSide: new BorderSide(color: ColorStyle.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                      borderSide: BorderSide(
                        width: 1,
                        color: ColorStyle.greyShade700,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: addDataController.add_aboutbooktxt,
                  decoration: InputDecoration(
                    labelText: 'About Book',
                    labelStyle: TextStyle(color: ColorStyle.grey),
                    hintText: 'About Book',
                    hintStyle: TextStyle(color: ColorStyle.grey),
                    prefixIcon: Icon(Icons.menu_book),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: ColorStyle.grey),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    border: new OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                      borderSide: new BorderSide(color: ColorStyle.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                      borderSide: BorderSide(
                        width: 1,
                        color: ColorStyle.greyShade700,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: addDataController.add_ratingtxt,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Rating',
                    labelStyle: TextStyle(color: ColorStyle.grey),
                    hintText: 'Enter Rating',
                    hintStyle: TextStyle(color: ColorStyle.grey),
                    prefixIcon: Icon(Icons.star),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: ColorStyle.grey),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    border: new OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                      borderSide: new BorderSide(color: ColorStyle.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                      borderSide: BorderSide(
                        width: 1,
                        color: ColorStyle.greyShade700,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: addDataController.add_yeartxt,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Publish Year',
                    labelStyle: TextStyle(color: ColorStyle.grey),
                    hintText: 'Enter Publish Year',
                    hintStyle: TextStyle(color: ColorStyle.grey),
                    prefixIcon: Icon(Icons.calendar_month_outlined),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: ColorStyle.grey),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    border: new OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                      borderSide: new BorderSide(color: ColorStyle.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                      borderSide: BorderSide(
                        width: 1,
                        color: ColorStyle.greyShade700,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    // print(
                    //     "============= ${(int.parse(addDataController.add_ratingtxt.text) < 5 && int.parse(addDataController.add_ratingtxt.text) > 0) ? "true" : "false"}");
                    if (addDataController.add_nametxt.text.isEmpty) {
                      Contasnts.contasnts
                          .errorToast(errorName: "Enter Name Of Book");
                    } else if (addDataController.add_imagetxt.text.isEmpty) {
                      Contasnts.contasnts
                          .errorToast(errorName: "Enter Image Link");
                    } else if (addDataController.add_authortxt.text.isEmpty) {
                      Contasnts.contasnts
                          .errorToast(errorName: "Enter Author Name ");
                    } else if (addDataController
                        .add_aboutauthortxt.text.isEmpty) {
                      Contasnts.contasnts
                          .errorToast(errorName: "Enter About Author Name ");
                    } else if (addDataController
                        .add_aboutbooktxt.text.isEmpty) {
                      Contasnts.contasnts
                          .errorToast(errorName: "Enter About Book Name ");
                    } else if (addDataController.add_ratingtxt.text.isEmpty) {
                      Contasnts.contasnts.errorToast(errorName: "Enter Rating");
                    } else if (int.parse(addDataController.add_ratingtxt.text) >
                            5 ||
                        int.parse(addDataController.add_ratingtxt.text) < 0) {
                      Contasnts.contasnts.errorToast(
                          errorName: "Please Enter rating 0, 1, 2, 3, 4, 5 ");
                    } else if (addDataController.add_yeartxt.text.isEmpty) {
                      Contasnts.contasnts
                          .errorToast(errorName: "Enter Publish Year");
                    } else {
                      Firebase_helper.firebase_helper.addData(
                          name: addDataController.add_nametxt.text,
                          auther: addDataController.add_authortxt.text,
                          image: addDataController.add_imagetxt.text,
                          desc: addDataController.add_aboutbooktxt.text,
                          year: addDataController.add_yeartxt.text,
                          rate: addDataController.add_ratingtxt.text,
                          aabout: addDataController.add_aboutauthortxt.text);
                      homeController.l1.clear();
                      Get.back();
                    }
                  },
                  child: Text("Submit"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
