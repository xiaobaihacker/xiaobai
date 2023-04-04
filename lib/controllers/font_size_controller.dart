import 'package:get/get.dart';

class FontSizeController extends GetxController {
  RxString screenLevel = 'tablet'.obs;
  //字体
  final fontFamily = 'BlogFontsMaShanZheng'.obs;
  changeTextStyle (object) {
    fontFamily.value = object;
  }
  

}