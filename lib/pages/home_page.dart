import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:xiaobai/controllers/back_ground_controller.dart';
import 'package:xiaobai/controllers/font_size_controller.dart';
import 'package:xiaobai/controllers/home_controller.dart';
import 'package:xiaobai/widgets/back_ground.dart';

import '../widgets/home.dart';
import '../widgets/wave.dart';

class HomePage extends GetView {
  HomePage({super.key});
  final homeController = Get.put(HomeController());
  final backGroundController = Get.put(BackGroundController());
  final fontSizeController = Get.put(FontSizeController());


  @override
  Widget build(BuildContext context) {
    //屏幕适配
    ScreenUtil.init(context);
    homeController.shortSreen.value = context.mediaQueryShortestSide;
    fontSizeController.screenLevel.value = context.responsiveValue(mobile: 'mobile',watch: 'watch',tablet: 'tablet',desktop: 'desktop');
    return Stack(
      children: [
        Obx(() => Positioned(child: BackGroundWidget(themes: backGroundController.themesValue.value)),),
        Positioned(child: HomeWidget()),
        
        onBottom(WaveAnimationWidget(
          height: 1.sw * 2 / 10,
          speed: 1.0,
        )),
        onBottom(WaveAnimationWidget(
          height: 1.sw  / 10,
          speed: 0.9,
          offset: pi,
        )),
        onBottom(WaveAnimationWidget(
          height: 1.sw * 3 / 10,
          speed: 1.2,
          offset: pi / 2,
        )),
      ],
    );
  }

  onBottom(Widget child) => Positioned.fill(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: child,
        ),
      );
  
}