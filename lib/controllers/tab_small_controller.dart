import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/tab.dart';

class TabBlogSmallController extends GetxController with GetSingleTickerProviderStateMixin{
  final tabSeletedIndex = 0.obs;
  late final TabController tabSmallController;

  void onTabTapped(int index) {
    tabSeletedIndex.value = index;
  }

  @override
  void onInit() {
    super.onInit();
    tabSmallController = TabController(length: listSmallTabs.length, vsync: this);
  }


}