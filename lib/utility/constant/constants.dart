import 'package:demo48/utility/constant/color_style.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class Contasnts {
  Contasnts._();
  static Contasnts contasnts = Contasnts._();
  void errorToast({required String errorName}) {
    Fluttertoast.showToast(
      msg: errorName,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 2,
      backgroundColor: ColorStyle.red,
      textColor: ColorStyle.white,
    );
  }

  void snackBar({required String title, required String subtitle}) {
    Get.snackbar(
      "Successfully Login",
      "Thank You",
      duration: Duration(seconds: 2),
      backgroundColor: ColorStyle.green,
    );
  }
}
