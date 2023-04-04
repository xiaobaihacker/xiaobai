import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:xiaobai/controllers/global_langs_controller.dart';
import 'package:xiaobai/widgets/font_size.dart';

import '../asset/icons/blog_icons.dart';

class GlobalLangsWidget extends StatelessWidget {
  final globalLangsController = Get.put(GlobalLangsController());

  @override
  Widget build(BuildContext context) {
    //屏幕适配
    ScreenUtil.init(context);
    return  PopupMenuButton(
    //默认值
    initialValue: Get.locale.toString(),
    //取消事件，没有选中任何一个选项
    //onCanceled: () => EasyLoading.showInfo('globalCancle'.tr),
    //鼠标指向时候显示的提示
    tooltip: 'language'.tr,
    padding: EdgeInsets.zero,
    //和图标冲突，也可以选择其他子组件作为显示方式
    //child: Text('child'),
    //组件区域大小，有默认跟从父级
    //splashRadius: 5,
    //图标
    icon: const Icon(BlogIcons.blogGlobal),
    //图标大小，可以默认
    //iconSize: 1.sh / 20,
    //偏移量，默认为 Offset.zero,可以通过改变该值是弹出框在合适的位置
    //offset: Offset(0,50),
    //弹出框可用还是不可用，默认为true
    //enabled: false,
    //弹出框大小 expand:无限约束，铺满整个屏幕
    //constraints: BoxConstraints.expand(),
    //严格约束，最大边界和最小边界相同，即为固定了盒子的宽高
    //constraints: BoxConstraints.tight(Size(pupupWidth,pupupHeight)),
    //BoxConstraints.loose(Size(maxWidth, maxHeight))
    //constraints: BoxConstraints.loose(Size(200,500)),
    //松散约束，盒子的最小边界为0，盒子的最大边界为无限，即屏幕
    //constraints: BoxConstraints.tightFor(),
    //有界约束，设置四个边界的值 BoxConstraints(minWidth, maxWidth, minHeight, maxHeight)
    //constraints: const BoxConstraints().copyWith(minWidth: 100,maxWidth: double.infinity,minHeight: 100,maxHeight: 200),
    //弹出位置，可以和偏移量一起使用，under 表示图标下方，over 表示图标所在位置弹出
    position: PopupMenuPosition.over,
    //下拉子组件
    itemBuilder: (BuildContext context) {
          return[
            PopupMenuItem(
              child: Material(
                shape: StadiumBorder(side: BorderSide()),
                child: FontSizeWidget(chilText: Text(' ' + 'langZh'.tr + ' ',)),
              ),
              value: 'zh-Cn',
            ),
            PopupMenuItem(
              child: Material(
                shape: StadiumBorder(side: BorderSide()),
                child: FontSizeWidget(chilText: Text(' ' + 'langEn'.tr + ' ',)),
              ),
              value: 'en-Us',
            ),
          ];
        },
    //选中事件
    onSelected: (object) {
          if (object == 'zh-Cn'){
            Get.updateLocale(Locale('zh_Cn'));
            globalLangsController.getChangeSources();
          }else {
            Get.updateLocale(Locale('en_Us'));
            globalLangsController.getChangeSources();
          }
        },
  );
  }

}