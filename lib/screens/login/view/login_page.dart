import 'package:demo48/screens/homeScreen/view/home_page.dart';
import 'package:demo48/screens/login/controller/login_controller.dart';
import 'package:demo48/screens/registration/controller/registration_controller.dart';
import 'package:demo48/screens/registration/view/registration_page.dart';
import 'package:demo48/utility/constant/color_style.dart';
import 'package:demo48/utility/constant/constants.dart';
import 'package:demo48/utility/helpers/firebase_helper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginController loginController = Get.put(LoginController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loginController.login_txtEmail.clear();
    loginController.login_txtPassword.clear();
  }

  @override
  Widget build(BuildContext context) {
    RegistrationController registrationController =
        Get.put(RegistrationController());
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
                      "LOGIN",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: ColorStyle.blueColorCode,
                          fontSize: 36),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: 40),
                    child: TextField(
                      controller: loginController.login_txtEmail,
                      decoration: InputDecoration(labelText: "Email Id"),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: 40),
                    child: TextField(
                      controller: loginController.login_txtPassword,
                      decoration: InputDecoration(labelText: "Password"),
                      obscureText: true,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                  InkWell(
                    onTap: () async {
                      if (loginController.login_txtEmail.text.isEmpty) {
                        Contasnts.contasnts
                            .errorToast(errorName: "Please Enter Email Id");
                      }
                      if (loginController.login_txtPassword.text.isEmpty) {
                        Contasnts.contasnts
                            .errorToast(errorName: "Please Enter Password");
                      } else {
                        bool isLogin = await Firebase_helper.firebase_helper
                            .login(loginController.login_txtEmail.text,
                                loginController.login_txtPassword.text);

                        if (isLogin == true) {
                          Get.snackbar(
                            "Successfully Registration",
                            "${loginController.login_txtEmail.text} Is Register",
                            duration: Duration(seconds: 2),
                            backgroundColor: ColorStyle.green,
                          );
                          registrationController.registration_txtName.clear();
                          registrationController.registration_txtEmail.clear();
                          registrationController.registration_txtPassword
                              .clear();
                          registrationController.registration_txtRePassword
                              .clear();
                          Get.off(
                            HomePage(),
                            transition: Transition.rightToLeft,
                            duration: Duration(milliseconds: 700),
                          );
                        } else {
                          Contasnts.contasnts.errorToast(
                              errorName: "Email Id And Password Not Match");
                        }
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
                          "LOGIN",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: ColorStyle.white),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    margin: EdgeInsets.symmetric(horizontal: 55),
                    child: GestureDetector(
                      onTap: () {
                        Get.to(
                          RegistrationPage(),
                          transition: Transition.rightToLeft,
                          duration: Duration(milliseconds: 700),
                        );
                      },
                      child: Text(
                        "Don't Have an Account ?",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: ColorStyle.blueColorCode),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.symmetric(
                      horizontal: 57,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IntrinsicHeight(
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () async {
                                  bool isLogin = await Firebase_helper
                                      .firebase_helper
                                      .googleSignIn();
                                  // print("==========================$isLogin");
                                  if (isLogin) {
                                    Contasnts.contasnts.snackBar(
                                        title: "Successfully Login",
                                        subtitle: "Thank You");

                                    Get.off(
                                      HomePage(),
                                    );
                                  }
                                },
                                child: Image.asset("assets/images/google.png"),
                              ),
                              VerticalDivider(
                                color: Colors.black,
                                thickness: 2,
                              ),
                              Image.asset("assets/images/facebook.png"),
                            ],
                          ),
                        ),
                      ],
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
