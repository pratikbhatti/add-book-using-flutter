import 'package:demo48/screens/homeScreen/modal/home_modal.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxBool isSwitched = false.obs;
  RxInt changeData = 0.obs;
  List<DataBookModel> l1 = [];

  void changeIndex(index) {
    changeData.value = index;
    update();
  }
}
