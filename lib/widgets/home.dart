import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:xiaobai/controllers/article_controller.dart';
import 'package:xiaobai/controllers/font_size_controller.dart';
import 'package:xiaobai/controllers/home_controller.dart';
import 'package:xiaobai/widgets/back_ground.dart';
import 'package:xiaobai/widgets/font_size.dart';
import 'package:xiaobai/widgets/tab.dart';

import 'audio.dart';
import 'global_lang.dart';

class HomeWidget extends StatelessWidget {
  HomeWidget({super.key});
  final homeController = Get.put(HomeController());
  final articleController = Get.put(ArticleController());
  final fontSizeController = Get.put(FontSizeController());

  @override
  Widget build(BuildContext context) {
    //屏幕适配
    ScreenUtil.init(context);
    return Scaffold(
      appBar: AppBar(
        leading:  Container(padding: EdgeInsets.only(top: 5,left: 10), child: SizedBox(child: CircleAvatar(foregroundImage: AssetImage('lib/asset/images/logo.png'),),)),
        title: FontSizeWidget(chilText: Text('personName'.tr)),
        bottom: PreferredSize(preferredSize: Size(1.sw/10, 1.sh/10), child: Obx(() =>TabWidget(isLargeScreen: homeController.isLargeScreen.value), ), ),
        actions: [
          GlobalLangsWidget(),
          FontFamilyWidget(),
          BackGroundPopupMenu(),
          MusicPupmenu(),
        ],
      ),
      body: Obx(() => TabViewWidget(isLargeScreen: homeController.isLargeScreen.value),), 
    );
  }
}
