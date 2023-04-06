import 'package:demo48/screens/adddata/controller/add_data_controller.dart';
import 'package:demo48/screens/editdata/controller/edit_controller.dart';
import 'package:demo48/screens/editdata/view/edit_data_page.dart';
import 'package:demo48/screens/homeScreen/controller/home_controller.dart';
import 'package:demo48/screens/homeScreen/view/home_page.dart';
import 'package:demo48/utility/constant/color_style.dart';
import 'package:demo48/utility/constant/constants.dart';
import 'package:demo48/utility/helpers/firebase_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class ViewData extends StatefulWidget {
  const ViewData({super.key});

  @override
  State<ViewData> createState() => _ViewDataState();
}

class _ViewDataState extends State<ViewData> {
  HomeController homeController = Get.put(HomeController());
  EditController editController = Get.put(EditController());
  AddDataController addDataController = Get.put(AddDataController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorStyle.greyShade300,
        appBar: AppBar(
          title: Text("View Data"),
          centerTitle: true,
          actions: [
            PopupMenuButton<int>(
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 1,
                  child: Row(
                    children: [
                      Text("Edit"),
                      Spacer(),
                      Icon(
                        Icons.edit,
                        color: ColorStyle.black,
                        size: 25,
                      ),
                    ],
                  ),
                ),
                // PopupMenuItem 2
                PopupMenuItem(
                  value: 2,
                  // row with two children
                  child: Row(
                    children: [
                      Text("delete"),
                      Spacer(),
                      Icon(
                        Icons.delete,
                        color: ColorStyle.red,
                        size: 25,
                      ),
                    ],
                  ),
                ),
              ],
              offset: Offset(60, 10),
              onSelected: (value) {
                if (value == 1) {
                  editController.edit_nametxt.text =
                      homeController.l1[homeController.changeData.value].name!;
                  editController.edit_imagetxt.text =
                      homeController.l1[homeController.changeData.value].image!;
                  editController.edit_authortxt.text = homeController
                      .l1[homeController.changeData.value].author!;
                  editController.edit_aboutauthortxt.text = homeController
                      .l1[homeController.changeData.value].aabout!;
                  editController.edit_aboutbooktxt.text = homeController
                      .l1[homeController.changeData.value].aboutBook!;
                  editController.edit_ratingtxt.text = homeController
                      .l1[homeController.changeData.value].rating!;
                  editController.edit_yeartxt.text = homeController
                      .l1[homeController.changeData.value].publishYear!;
                  editController.UpdateId.value =
                      homeController.l1[homeController.changeData.value].id!;
                  Get.to(
                    EditDataPage(),
                    transition: Transition.rightToLeft,
                    duration: Duration(milliseconds: 700),
                  );
                } else if (value == 2) {
                  Firebase_helper.firebase_helper.DeleteBook(
                      id: homeController
                          .l1[homeController.changeData.value].id!);
                  Contasnts.contasnts
                      .snackBar(title: "Delete Successfully", subtitle: "");
                  Get.off(
                    HomePage(),
                    transition: Transition.leftToRight,
                    duration: Duration(milliseconds: 700),
                  );
                }
              },
            ),
          ],
        ),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 120, right: 10, left: 10, bottom: 15),
              child: Card(
                elevation: 20,
                child: Container(
                  height: MediaQuery.of(context).size.height / 1.1,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: ColorStyle.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 70),
                        child: Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width / 0.8,
                          child: Text(
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            softWrap: false,
                            "${homeController.l1[homeController.changeData.value].name}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RatingBarIndicator(
                            rating: double.parse(
                                "${homeController.l1[homeController.changeData.value].rating}"),
                            itemBuilder: (context, index) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            itemCount: 5,
                            itemSize: 22.0,
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Text(
                              "${homeController.l1[homeController.changeData.value].rating}.0")
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Author Name :- ",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Text(
                                "${homeController.l1[homeController.changeData.value].author}"),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Publish Year :- ",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Text(
                                "${homeController.l1[homeController.changeData.value].publishYear}"),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Container(
                          width: MediaQuery.of(context).size.width / 0.8,
                          child: Text(
                            overflow: TextOverflow.ellipsis,
                            maxLines: 16,
                            softWrap: false,
                            "${homeController.l1[homeController.changeData.value].aboutBook}",
                            style: TextStyle(color: ColorStyle.greyShade700),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 23, left: 115),
              child: Card(
                elevation: 30,
                child: Container(
                  height: MediaQuery.of(context).size.height / 5,
                  width: MediaQuery.of(context).size.width / 3,
                  decoration: BoxDecoration(
                    color: ColorStyle.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      "${homeController.l1[homeController.changeData.value].image}",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
