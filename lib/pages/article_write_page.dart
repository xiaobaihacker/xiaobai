import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controllers/back_ground_controller.dart';
import '../controllers/font_size_controller.dart';
import '../widgets/article_write.dart';
import '../widgets/back_ground.dart';
import '../widgets/wave.dart';

class ArticleWritePage extends GetView{
  final fontSizeController = Get.put(FontSizeController());
  final backGroundController = Get.put(BackGroundController());
  @override
  Widget build(BuildContext context) {
    //屏幕适配
    ScreenUtil.init(context);
    fontSizeController.screenLevel.value = context.responsiveValue(mobile: 'mobile',watch: 'watch',tablet: 'tablet',desktop: 'desktop');
    return Stack(
      children: [
        Obx(() => Positioned(child: BackGroundWidget(themes: backGroundController.themesValue.value)),),
        Positioned(child: ArticleWriteWidget()),
        
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