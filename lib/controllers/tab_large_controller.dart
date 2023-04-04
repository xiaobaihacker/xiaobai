import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xiaobai/widgets/tab.dart';

class TabBlogLargeController extends GetxController with GetSingleTickerProviderStateMixin{
  final tabSeletedIndex = 0.obs;
  late final TabController tabLargeController;

  void onTabTapped(int index) {
    tabSeletedIndex.value = index;
  }

  @override
  void onInit() {
    super.onInit();
    tabLargeController = TabController(length: listLargeTabs.length, vsync: this);
  }


}