import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArticleWriteController extends GetxController {
  final radioGroupValue = 'personLabel'.obs;
  final groups = ['personLabel','sciLabel','flutterLabel','javaLabel','goLabel'].obs;
  final titleZhTextController = TextEditingController();
  final titleUsTextController = TextEditingController();
  final introduceZhTextController = TextEditingController();
  final introduceUsTextController = TextEditingController();
  RxList<Widget> introduces = <Widget>[].obs;
  checkRadioValue (value) {
    radioGroupValue.value = value;
  }

  submitArticle () {
    switch (radioGroupValue.value) {
      case 'personLabel': 
        List strZh = introduceZhTextController.text.split('#');
        List strUs = introduceUsTextController.text.split('#');
        String title = titleZhTextController.text;
        String postTime = DateTime.now().toString().substring(0,19);
        String jsonStr = "{'title':'$title','subTitle':'个人中心','langs':'zh_Cn','postTime':'$postTime','introduce':$strZh}";
        debugPrint(jsonStr);
        title = titleUsTextController.text;
        jsonStr = "{'title':'$title','subTitle':'personLabel','langs':'en_Us','postTime':'$postTime','introduce':$strUs}";
        debugPrint(jsonStr);
        break;
      case 'sciLabel': 
        List strZh = introduceZhTextController.text.split('#');
        List strUs = introduceUsTextController.text.split('#');
        String title = titleZhTextController.text;
        String postTime = DateTime.now().toString().substring(0,19);
        String jsonStr = "{'title':'$title','subTitle':'科学上网','langs':'zh_Cn','postTime':'$postTime','introduce':$strZh}";
        debugPrint(jsonStr);
        title = titleUsTextController.text;
        jsonStr = "{'title':'$title','subTitle':'sciLabel','langs':'en_Us','postTime':'$postTime','introduce':$strUs}";
        debugPrint(jsonStr);
        break;
      default :
        break;
    }

  }

  @override
  void onInit() {
    super.onInit();
  }

}