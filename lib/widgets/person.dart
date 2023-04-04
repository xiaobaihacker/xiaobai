import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:xiaobai/controllers/article_controller.dart';
import 'package:xiaobai/controllers/location_controller.dart';
import 'package:xiaobai/pages/article_write_page.dart';
import 'package:xiaobai/widgets/font_size.dart';

import '../asset/icons/blog_icons.dart';

class PersonWidget extends StatelessWidget {
  final articleController = Get.put(ArticleController());
  final locationController = Get.put(LocationController());
  @override
  Widget build(BuildContext context) {
    //屏幕适配
    ScreenUtil.init(context);
    return ListView(
      children: [
        Container(
          padding: EdgeInsets.only(top: 10,left: 10),
          child: Column(
            children: [
              Container(
                width: 1.sw / 4,
                child: Material(
                  color: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Column(
                    children: [
                      Container(
                        child: SizedBox(
                          height: 1.sw /8,
                          width: 1.sw / 8,
                          child: CircleAvatar(
                            foregroundImage: AssetImage('lib/asset/images/avatar.png'),
                          ),
                        )
                      ),
                      Container(
                        child: Material(
                          color: Colors.transparent,
                          child: FontSizeWidget(chilText: Text('personName'.tr))
                        )
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 20,bottom: 20),
                        child: Material(
                          color: Colors.transparent,
                          child: articleController.getPersonsFeel(),
                        )
                      ),
                      Container(
                        child: Column(
                          children: [
                            Obx(() => FontSizeWidget(chilText: Text(articleController.articleNum.value.toString()),),),
                            FontSizeWidget(chilText: Text('article'.tr),),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 20,bottom: 20),
                        child: Material(
                          color: Colors.lightBlue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: TextButton(
                            child: FontSizeWidget(chilText: Text('personHome'.tr),),
                            onPressed: () { 
                              //Get.to(()=> ArticleWritePage());
                             },
                          ),
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 20),
                              child: IconButton(
                              icon: Icon(BlogIcons.blogWeixin),
                              onPressed: () { 
                                Get.bottomSheet(Container(child: Image(image: AssetImage('lib/asset/images/weichat.jpg')),));
                               },),),
                            Container(child: IconButton(
                              icon: Icon(BlogIcons.blogQQ),
                              onPressed: () { 
                                Get.bottomSheet(Container(child: Image(image: AssetImage('lib/asset/images/qqchat.jpg')),));
                               },),),
                            Container(
                              padding: EdgeInsets.only(right: 20),
                              child: IconButton(
                              icon: Icon(BlogIcons.blogMail),
                              onPressed: () { 
                                Get.bottomSheet(Container(alignment: Alignment.center,child: SelectableText('xiaobaihacker@outlook.com',style: TextStyle(fontSize: 20),),));
                               },),),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: 1.sw / 4,
                padding: EdgeInsets.only(top: 10),
                child: Material(
                  color: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Column(
                    children: [
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Obx(() =>
                              Container(
                                child: Column(
                                  children: [
                                    Container(padding: EdgeInsets.only(left: 10),child:FontSizeWidget(chilText: Text(locationController.accuWratherModel.value.unitTemp.toString() + '℃'),),),
                                    Container(
                                      padding: EdgeInsets.only(left: 10,top: 20,bottom: 20),
                                      child:FontSizeWidget(
                                        chilText: Text(
                                          ' ' + locationController.accuWratherModel.value.minTemp.toString() + '℃/' 
                                          + locationController.accuWratherModel.value.maxTemp.toString() + '℃'
                                        ),
                                      ),
                                    ),
                                    Container(padding: EdgeInsets.only(left: 10,),child: FontSizeWidget(chilText: Text((locationController.accuWratherModel.value.preType == true ? 'rain'.tr : 'sunny'.tr)),),)
                                  ],
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                Container(padding: EdgeInsets.only(top: 10),child: FontSizeWidget(chilText: Text(DateTime.now().toString().substring(5,10)),),),
                                Container(child: Image.asset('lib/asset/images/localtion.png'),width: 1.sw/8,height: 1.sw/8,)
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: IconButton(
                          icon: Icon(BlogIcons.blogLocation), 
                          onPressed: () { 
                              locationController.getWeather();
                              locationController.daysUntiilSaturday();
                          },
                        ),  
                      ),
                      Container(
                        child: Obx(() => 
                          FontSizeWidget(
                            chilText: Text(
                              locationController.accuWratherModel.value.parentCity.toString()
                              + ' ' +locationController.accuWratherModel.value.city.toString()
                            )
                          )
                        )
                      ),
                      Obx(() => 
                        Container(
                          child: FontSizeWidget(
                            chilText: Text(
                              locationController.accuWratherModel.value.region.toString() + ' '
                              + locationController.accuWratherModel.value.country.toString() + ' '
                              + locationController.accuWratherModel.value.adminArea.toString()
                            )
                          ),
                        ),
                      ), 
                      Container(
                        padding: EdgeInsets.only(top: 20),
                        child: Obx(() => 
                          locationController.isWeekend.value ? FontSizeWidget(chilText: Text('untilWeekend'.tr))
                          : FontSizeWidget(chilText: Text('frontUntil'.tr + locationController.untilSaturday.value.toString() + 'backUntil'.tr))
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

}