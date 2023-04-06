import 'package:demo48/screens/login/controller/login_controller.dart';
import 'package:demo48/screens/login/view/login_page.dart';
import 'package:demo48/screens/registration/controller/registration_controller.dart';
import 'package:demo48/utility/constant/color_style.dart';
import 'package:demo48/utility/constant/constants.dart';
import 'package:demo48/utility/helpers/firebase_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  RegistrationController registrationController =
      Get.put(RegistrationController());
  LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Positioned(
                top: 0,
                right: 0,
                child: Image.asset("assets/images/top1.png",
                    width: MediaQuery.of(context).size.width),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: Image.asset("assets/images/top2.png",
                    width: MediaQuery.of(context).size.width),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Image.asset("assets/images/bottom1.png",
                    width: MediaQuery.of(context).size.width),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Image.asset("assets/images/bottom2.png",
                    width: MediaQuery.of(context).size.width),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Text(
                      "REGISTRATION",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: ColorStyle.blueColorCode,
                          fontSize: 32),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: 40),
                    child: TextField(
                      controller: registrationController.registration_txtName,
                      decoration: InputDecoration(labelText: "Name"),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: 40),
                    child: TextField(
                      controller: registrationController.registration_txtEmail,
                      decoration: InputDecoration(labelText: "Email Id"),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: 40),
                    child: TextField(
                      controller:
                          registrationController.registration_txtPassword,
                      decoration: InputDecoration(labelText: "Password"),
                      obscureText: true,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: 40),
                    child: TextField(
                      controller:
                          registrationController.registration_txtRePassword,
                      decoration: InputDecoration(labelText: "Re Password"),
                      obscureText: true,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                  InkWell(
                    onTap: () async {
                      // print(Firebase_helper.firebase_helper.checkEmail)
                      // var a = await Firebase_helper.firebase_helper.checkEmail(
                      //     registrationController.registration_txtEmail.text);
                      // print("===================$a");
                      if (registrationController
                          .registration_txtName.text.isEmpty) {
                        Contasnts.contasnts
                            .errorToast(errorName: "Please Enter Name");
                      } else if (registrationController
                          .registration_txtEmail.text.isEmpty) {
                        Contasnts.contasnts
                            .errorToast(errorName: "Please Enter Email Id");
                      } else if (registrationController
                          .registration_txtPassword.text.isEmpty) {
                        Contasnts.contasnts
                            .errorToast(errorName: "Please Enter Password");
                      } else if (registrationController
                          .registration_txtRePassword.text.isEmpty) {
                        Contasnts.contasnts
                            .errorToast(errorName: "Please Enter Re Password");
                      } else if (registrationController
                              .registration_txtPassword.text !=
                          registrationController
                              .registration_txtRePassword.text) {
                        Contasnts.contasnts.errorToast(
                            errorName: "Password And Re Password Are not Same");
                      } else {
                        Firebase_helper.firebase_helper.registration(
                            registrationController.registration_txtEmail.text,
                            registrationController
                                .registration_txtPassword.text);
                        loginController.login_txtEmail.clear();
                        loginController.login_txtPassword.clear();

                        Contasnts.contasnts.snackBar(
                            title: "Successfully Registration",
                            subtitle:
                                "${registrationController.registration_txtEmail.text} Is Register");

                        Get.back();
                      }
                    },
                    child: Container(
                      alignment: Alignment.centerRight,
                      margin:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                      child: Container(
                        alignment: Alignment.center,
                        height: 50.0,
                        width: MediaQuery.of(context).size.width * 0.5,
                        decoration: new BoxDecoration(
                          borderRadius: BorderRadius.circular(80.0),
                          gradient: new LinearGradient(
                            colors: [
                              ColorStyle.dark_Orange,
                              ColorStyle.light_Orange
                            ],
                          ),
                        ),
                        padding: const EdgeInsets.all(0),
                        child: Text(
                          "REGISTRATION",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: ColorStyle.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
