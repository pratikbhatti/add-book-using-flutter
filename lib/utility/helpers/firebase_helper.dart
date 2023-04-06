import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo48/screens/homeScreen/modal/home_modal.dart';
import 'package:demo48/utility/constant/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Firebase_helper extends GetxController {
  Firebase_helper._();
  static Firebase_helper firebase_helper = Firebase_helper._();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  String UserUid = "";
  bool isRegistration = false;

  Future<List<String>> checkEmail(String emailAuth) async {
    final signInMethods =
        await FirebaseAuth.instance.fetchSignInMethodsForEmail(emailAuth);
    return signInMethods;
  }

  /// registration user
  Future<bool> registration(String email, String password) async {
    try {
      await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        isRegistration = true;
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Contasnts.contasnts.errorToast(errorName: "Password Mst Been 6");
      } else if (e.code == 'email-already-in-use') {
        Contasnts.contasnts.errorToast(errorName: "Email Alread exits");
      }
    }

    return isRegistration;
  }

  /// login user
  Future<bool> login(String email, String password) async {
    bool isLogin = false;
    await firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      isLogin = true;
    }).catchError((error) {
      isLogin = false;
    });
    return isLogin;
  }

  // check is Login

  bool checkLogin() {
    if (firebaseAuth.currentUser != null) {
      return true;
    }
    return false;
  }

  //Google Signing
  Future<bool> googleSignIn() async {
    GoogleSignInAccount? googleSignInAccount = await GoogleSignIn().signIn();
    GoogleSignInAuthentication? googleSignInAuthentication =
        await googleSignInAccount!.authentication;
    var crd = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken);

    return firebaseAuth
        .signInWithCredential(crd)
        .then((value) => true)
        .catchError((error) {
      return false;
    });
  }

  /// home page log out
  void logOut() async {
    await firebaseAuth.signOut();
  }

// ====================================== Firestore ================================================//
  void UserDetails() {
    User? user = firebaseAuth.currentUser;
    UserUid = user!.uid;
  }

  Future<void> addData(
      {required String name,
      required String auther,
      required String image,
      required String desc,
      required String year,
      required String rate,
      required String aabout}) async {
    UserDetails();
    await firebaseFirestore
        .collection("Users")
        .doc(UserUid)
        .collection("books")
        .add({
      "about": aabout,
      "author": auther,
      "desc": desc,
      "image": image,
      "name": name,
      "publish": year,
      "rating": rate
    });
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> readData() {
    UserDetails();
    return firebaseFirestore
        .collection("Users")
        .doc(UserUid)
        .collection("books")
        .snapshots();
  }

  void updateData(
      {required String id,
      required String name,
      required String auther,
      required String image,
      required String desc,
      required String year,
      required String rate,
      required String aabout}) {
    UserDetails();
    firebaseFirestore
        .collection("Users")
        .doc(UserUid)
        .collection("books")
        .doc(id)
        .update({
      "about": aabout,
      "author": auther,
      "desc": desc,
      "image": image,
      "name": name,
      "publish": year,
      "rating": rate
    });
  }

  void DeleteBook({required String id}) {
    UserDetails();
    firebaseFirestore
        .collection("Users")
        .doc(UserUid)
        .collection("books")
        .doc(id)
        .delete();
  }
}
