import 'package:get/get.dart';

class BackGroundController extends GetxController {
  final themesValue = 'nomalQiCai'.obs;
  changeTheme (value) {
    themesValue.value = value;
  }
  
  
}