import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo48/screens/adddata/controller/add_data_controller.dart';
import 'package:demo48/screens/adddata/view/addData_page.dart';
import 'package:demo48/screens/homeScreen/controller/home_controller.dart';
import 'package:demo48/screens/homeScreen/modal/home_modal.dart';
import 'package:demo48/screens/login/view/login_page.dart';
import 'package:demo48/screens/viewdata/view/view_data_page.dart';
import 'package:demo48/utility/constant/color_style.dart';
import 'package:demo48/utility/helpers/firebase_helper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:focused_menu/modals.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:focused_menu/focused_menu.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController homeController = Get.put(HomeController());
  AddDataController addDataController = Get.put(AddDataController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorStyle.greyShade300,
        appBar: AppBar(
          title: Text("Home Page"),
          centerTitle: true,
          elevation: 0,
          actions: [
            PopupMenuButton<int>(
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 1,
                  child: Row(
                    children: [
                      Text("Theme"),
                      Spacer(),
                      Obx(
                        () => Switch(
                          value: homeController.isSwitched.value,
                          onChanged: (value) {
                            homeController.isSwitched.value = value;
                          },
                        ),
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
                      Text("Logout"),
                      Spacer(),
                      Icon(
                        Icons.logout_outlined,
                        color: ColorStyle.black,
                        size: 25,
                      ),
                    ],
                  ),
                ),
              ],
              offset: Offset(60, 10),
              onSelected: (value) {
                if (value == 1) {
                } else if (value == 2) {
                  Firebase_helper.firebase_helper.logOut();
                  Get.off(
                    LoginPage(),
                    transition: Transition.leftToRight,
                    duration: Duration(milliseconds: 700),
                  );
                }
              },
            ),
          ],
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: Firebase_helper.firebase_helper.readData(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text("${snapshot.error}");
            } else if (snapshot.hasData) {
              QuerySnapshot? rawData = snapshot.data;
              homeController.l1.clear();
              var docs = rawData!.docs;
              for (var x in docs) {
                DataBookModel d1 = DataBookModel(
                    aabout: x['about'],
                    aboutBook: x['desc'],
                    author: x['author'],
                    image: x['image'],
                    name: x['name'],
                    publishYear: x['publish'],
                    rating: x['rating'],
                    id: x.id);

                homeController.l1.add(d1);
              }
              return ListView.builder(
                itemCount: homeController.l1.length,
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      InkWell(
                        onTap: () {
                          homeController.changeIndex(index);
                          Get.to(
                            ViewData(),
                            transition: Transition.rightToLeft,
                            duration: Duration(milliseconds: 700),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 8, right: 8, left: 98, bottom: 8),
                          child: Card(
                            elevation: 20,
                            child: Container(
                              height: MediaQuery.of(context).size.height / 4,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: ColorStyle.white,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 8, left: 52),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width /
                                          0.8,
                                      child: Text(
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        softWrap: false,
                                        "${homeController.l1[index].name}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 7,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 47, right: 5),
                                    child: Row(
                                      children: [
                                        RatingBarIndicator(
                                          rating: double.parse(
                                              "${homeController.l1[index].rating}"),
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
                                            "${homeController.l1[index].rating}.0")
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 7,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 52, right: 10),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width /
                                          0.8,
                                      child: Text(
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 4,
                                        softWrap: false,
                                        "${homeController.l1[index].aboutBook}",
                                        style: TextStyle(
                                            color: ColorStyle.greyShade700),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 23, left: 20),
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
                                "${homeController.l1[index].image}",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  );
                },
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            addDataController.add_nametxt.clear();
            addDataController.add_imagetxt.clear();
            addDataController.add_authortxt.clear();
            addDataController.add_aboutauthortxt.clear();
            addDataController.add_aboutbooktxt.clear();
            addDataController.add_ratingtxt.clear();
            addDataController.add_yeartxt.clear();
            Get.to(
              AddDataPage(),
              transition: Transition.rightToLeft,
              duration: Duration(milliseconds: 700),
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
