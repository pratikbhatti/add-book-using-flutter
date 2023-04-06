import 'package:demo48/screens/editdata/controller/edit_controller.dart';
import 'package:demo48/screens/viewdata/view/view_data_page.dart';
import 'package:demo48/utility/constant/color_style.dart';
import 'package:demo48/utility/constant/constants.dart';
import 'package:demo48/utility/helpers/firebase_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class EditDataPage extends StatefulWidget {
  const EditDataPage({super.key});

  @override
  State<EditDataPage> createState() => _EditDataPageState();
}

class _EditDataPageState extends State<EditDataPage> {
  EditController editController = Get.put(EditController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Edit Data"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextFormField(
                  controller: editController.edit_nametxt,
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
                  controller: editController.edit_imagetxt,
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
                  controller: editController.edit_authortxt,
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
                  controller: editController.edit_aboutauthortxt,
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
                  controller: editController.edit_aboutbooktxt,
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
                  controller: editController.edit_ratingtxt,
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
                  controller: editController.edit_yeartxt,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (editController.edit_nametxt.text.isEmpty) {
                          Contasnts.contasnts
                              .errorToast(errorName: "Enter Name Of Book");
                        } else if (editController.edit_imagetxt.text.isEmpty) {
                          Contasnts.contasnts
                              .errorToast(errorName: "Enter Image Link");
                        } else if (editController.edit_authortxt.text.isEmpty) {
                          Contasnts.contasnts
                              .errorToast(errorName: "Enter Author Name ");
                        } else if (editController
                            .edit_aboutauthortxt.text.isEmpty) {
                          Contasnts.contasnts.errorToast(
                              errorName: "Enter About Author Name ");
                        } else if (editController
                            .edit_aboutbooktxt.text.isEmpty) {
                          Contasnts.contasnts
                              .errorToast(errorName: "Enter About Book Name ");
                        } else if (editController.edit_ratingtxt.text.isEmpty) {
                          Contasnts.contasnts
                              .errorToast(errorName: "Enter Rating");
                        } else if (int.parse(
                                    editController.edit_ratingtxt.text) >
                                5 ||
                            int.parse(editController.edit_ratingtxt.text) < 0) {
                          Contasnts.contasnts.errorToast(
                              errorName:
                                  "Please Enter rating 0, 1, 2, 3, 4, 5 ");
                        } else if (editController.edit_yeartxt.text.isEmpty) {
                          Contasnts.contasnts
                              .errorToast(errorName: "Enter Publish Year");
                        } else {
                          Firebase_helper.firebase_helper.updateData(
                              id: homeController
                                  .l1[homeController.changeData.value].id!,
                              name: editController.edit_nametxt.text,
                              auther: editController.edit_authortxt.text,
                              image: editController.edit_imagetxt.text,
                              desc: editController.edit_aboutbooktxt.text,
                              year: editController.edit_yeartxt.text,
                              rate: editController.edit_ratingtxt.text,
                              aabout: editController.edit_aboutauthortxt.text);
                          Contasnts.contasnts.snackBar(
                              title: "Update Succefully", subtitle: "");
                          Get.back();
                        }
                      },
                      child: Text("Submit"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Text("Cancel"),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
