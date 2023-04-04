import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xiaobai/controllers/font_size_controller.dart';

import '../asset/icons/blog_icons.dart';

class FontSizeWidget extends StatelessWidget {
  FontSizeWidget({super.key,required this.chilText});
  final fontSizeController = Get.put(FontSizeController());
  final Text chilText;

  @override
  Widget build(BuildContext context) {
    switch (fontSizeController.screenLevel.value) {
      case 'watch': 
        return Obx(() => DefaultTextStyle(
          style: TextStyle(
            fontFamily: fontSizeController.fontFamily.value,
            color: Colors.white,
            fontSize: 16
            ), 
          child: chilText
          )
        );
      case 'mobile': 
        return Obx(() => DefaultTextStyle(
          style: TextStyle(
            fontFamily: fontSizeController.fontFamily.value,
            color: Colors.white,
            fontSize: 20
            ), 
          child: chilText
          )
        );
      case 'tablet': 
        return Obx(() => DefaultTextStyle(
          style: TextStyle(
            fontFamily: fontSizeController.fontFamily.value,
            color: Colors.white,
            fontSize: 24
            ), 
          child: chilText
          )
        );
      case 'desktop': 
        return Obx(() => DefaultTextStyle(
          style: TextStyle(
            fontFamily: fontSizeController.fontFamily.value,
            color: Colors.white,
            fontSize: 28
            ), 
          child: chilText
          )
        );
      default : 
        return Obx(() => DefaultTextStyle(
          style: TextStyle(
            fontFamily: fontSizeController.fontFamily.value,
            color: Colors.white,
            fontSize: 16
            ), 
          child: chilText
          )
        );
    }
  }

}

class FontFamilyWidget extends StatelessWidget {
  final fontSizeController = Get.put(FontSizeController());
  FontFamilyWidget({super.key,});
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: const Icon(BlogIcons.blogTextStyle),
      tooltip: 'text'.tr,
      padding: EdgeInsets.zero,
      itemBuilder: (BuildContext context ) {
        return [
            PopupMenuItem(
              child: Material(
                shape: StadiumBorder(side: BorderSide()),
                child: FontSizeWidget(chilText: Text(' ' + 'cao'.tr + ' ',)),
              ),
              value: 'BlogFontsLiuJianmaoCao',
            ),
            PopupMenuItem(
              child: Material(
                shape: StadiumBorder(side: BorderSide()),
                child: FontSizeWidget(chilText: Text(' ' + 'xing'.tr + ' ',)),
              ),
              value: 'BlogFontsZhiMangXing',
            ),
            PopupMenuItem(
              child: Material(
                shape: StadiumBorder(side: BorderSide()),
                child: FontSizeWidget(chilText: Text(' ' + 'kai'.tr + ' ',)),
              ),
              value: 'BlogFontsMaShanZheng',
            ),
        ];
      },
      onSelected: (object) {
          fontSizeController.changeTextStyle(object);
      },
    );
  }
}