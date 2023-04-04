import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //获取屏幕最短边，比较最短边小于350 是小屏幕设备访问，大于350是大屏幕设备访问
  RxDouble shortSreen = 0.0.obs;
  RxBool isLargeScreen = true.obs;
  changeIsLargeScreen () {
    if (shortSreen.value < 650){
      isLargeScreen.value = false;
    }else {
      isLargeScreen.value = true;
    }
  }
  @override
  void onInit() {
    //监听shortSreen 变化就调用
    ever(shortSreen, (callback) => (changeIsLargeScreen()));
    super.onInit();
    
  }

}