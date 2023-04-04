import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:xiaobai/controllers/article_write_controller.dart';

import 'audio.dart';
import 'back_ground.dart';
import 'font_size.dart';
import 'global_lang.dart';

class ArticleWriteWidget extends StatelessWidget {
  final articleWriteController = Get.put(ArticleWriteController());
  @override
  Widget build(BuildContext context) {
    //屏幕适配
    ScreenUtil.init(context);
    return Scaffold(
      appBar: AppBar(
        title: FontSizeWidget(chilText: Text('personName'.tr)),
        actions: [
          GlobalLangsWidget(),
          FontFamilyWidget(),
          BackGroundPopupMenu(),
          MusicPupmenu(),
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(top: 10,left: 10,right: 10,bottom: 10),
        child:Material(
          color: Colors.transparent,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10)
          ),
          child: ListView(
            children:[
              Obx(() => Radios(list: articleWriteController.groups.value,)),
              Obx(() => ArticleWriteTtile(label: articleWriteController.radioGroupValue.value)),
            ]
          )
        )
      )
    );               
  }
}

class Radios extends StatelessWidget {
  List list;
  Radios({super.key,required this.list});
  final articleWriteController = Get.put(ArticleWriteController());

  @override
  Widget build(BuildContext context) {
    List<Widget> wList = [];
    for (var element in list) {
      wList.add(Obx(() =>
        SizedBox(
          width: 1.sw/6,
          child: RadioListTile(
            title: FontSizeWidget(chilText: Text(element.toString().tr)), 
            groupValue: articleWriteController.radioGroupValue.value, 
            onChanged: (value) { articleWriteController.checkRadioValue(value); }, 
            value: element,
            ),
          ),
        )
      );
    }
    return Row(
      children: wList,
      mainAxisAlignment: MainAxisAlignment.center,
    );
  }
}

class ArticleWriteTtile extends StatelessWidget {
  final label;
  ArticleWriteTtile({super.key,required this.label});
  final articleWriteController = Get.put(ArticleWriteController());
  

  @override
  Widget build(BuildContext context) {
    return 
      Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 10,left: 20,right: 20),
              child: Material(
                color: Colors.transparent,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: TextField(
                  controller: articleWriteController.titleZhTextController,
                  minLines: 1,
                  maxLines: 2,
                  decoration: InputDecoration(hintText: label.toString().tr + ' ' + 'hintTitle'.tr + ' ' + 'langZh'.tr),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10,left: 20,right: 20),
              child: Material(
                color: Colors.transparent,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: TextField(
                  controller: articleWriteController.titleUsTextController,
                  minLines: 1,
                  maxLines: 2,
                  decoration: InputDecoration(hintText: label.toString().tr + ' ' + 'hintTitle'.tr + ' ' + 'langEn'.tr),
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(top: 10,left: 20,right: 20),
              child: Material(
                color: Colors.transparent,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: TextButton(
                  child: FontSizeWidget(chilText: Text('addIntroduce'.tr),),
                  onPressed: () { articleWriteController.introduces.add(Obx(() => ArticleWriteIntroduce(label: articleWriteController.radioGroupValue.value,))); },
                )
              ),
            ),
            Obx(() => Column(children: articleWriteController.introduces.value,),),
            Container(
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.only(top: 10,left: 20,right: 20),
              child: Material(
                color: Colors.transparent,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: TextButton(
                  child: FontSizeWidget(chilText: Text('submitButton'.tr),),
                  onPressed: () { articleWriteController.submitArticle(); },
                )
              ),
            )
          ],
        ),
      
    );
  }
}

class ArticleWriteIntroduce extends StatelessWidget {
  String label;
  ArticleWriteIntroduce({super.key,required this.label});
  final articleWriteController = Get.put(ArticleWriteController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: 10,left: 20,right: 20),
          child: Material(
            color: Colors.transparent,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(10)
            ),
            child: TextField(
              controller: articleWriteController.introduceZhTextController,
              minLines: 10,
              maxLines: 20,
              decoration: InputDecoration(hintText: label.toString().tr + ' ' + 'introduce'.tr + ' ' + 'langZh'.tr),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 10,left: 20,right: 20),
          child: Material(
            color: Colors.transparent,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(10)
            ),
            child: TextField(
              controller: articleWriteController.introduceUsTextController,
              minLines: 10,
              maxLines: 20,
              decoration: InputDecoration(hintText: label.toString().tr + ' ' + 'introduce' + ' ' + 'langEn'.tr),
            ),
          ),
        ),
      ],
    );
  }

}