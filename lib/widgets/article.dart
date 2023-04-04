import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xiaobai/controllers/article_controller.dart';
import 'package:xiaobai/widgets/font_size.dart';

import '../controllers/font_size_controller.dart';
import 'audio.dart';
import 'back_ground.dart';

class ArticleWidget extends StatelessWidget {
  final articleController = Get.put(ArticleController());
  final fontSizeController = Get.put(FontSizeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FontSizeWidget(chilText: Text('personName'.tr)),
        actions: [
          FontFamilyWidget(),
          BackGroundPopupMenu(),
          MusicPupmenu(),
        ],
      ),
      body: Obx(() => Article(list: articleController.articles.value,)),
    );
  }

}

class Article extends StatelessWidget {
  List list;
  final articleController = Get.put(ArticleController());
  dynamic option;

  Article({super.key,required this.list});
  
  @override
  Widget build(BuildContext context) {
    for (var element in list) {
      if (articleController.articleSelectedIndex.value == element.aticleId) {
        option = element;
      }
    }
    return ListView(
      children: [
        Container(
          padding: EdgeInsets.only(top: 10,left: 10,right:10),
          child: Material(
            color: Colors.transparent,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(10)
            ),
            child: ListTile(
              title: Container(padding: EdgeInsets.only(top: 10,bottom: 10),child: FontSizeWidget(chilText: Text(option.title.toString()),),),
              subtitle: ListTile(
                title: Container(
                  child:Row(
                    children: [
                      Material(
                        color: Colors.lightBlue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: TextButton(
                          onPressed: () {  },
                          child: FontSizeWidget(chilText: Text(option.subTitle.toString())),
                        ),
                      )
                    ]
                  )
                ),
                subtitle: Column(
                  children: [
                    ArticleIntroduce(introduce: option.introduce,),
                    Container(padding: EdgeInsets.only(top: 10),alignment: Alignment.centerLeft,child: FontSizeWidget(chilText: Text(option.postTime.toString())),)
                  ],
                )
              )
              
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 10,left: 10,right:10),
          child: Material(
            color: Colors.transparent,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(10)
            ),
            child: Column(
              children: [
                ListTile(
                  title: Container(
                    child: Column (
                      children: [
                        TextField(
                          maxLines: 2,
                          minLines: 1,
                        ),
                      ],
                    ),
                  ),
                ),
                ListTile(
                  title: Row(
                    children: [
                      Material(
                        color: Colors.lightBlue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: TextButton(
                          onPressed: () {  },
                          child: FontSizeWidget(chilText: Text('comment'.tr)),
                        ),
                      ),
                      
                    ],
                  ),
                )
              ],
            ),
          )
        )
      ],
    );
  }
}

class ArticleIntroduce extends StatelessWidget {
  List introduce;
  ArticleIntroduce({super.key,required this.introduce});

  bool isImage (String str) {
    return str.startsWith('lib/asset/images/');
  }

  bool isLink (String str) {
    return str.contains(RegExp('\[http\]'));
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> list = [] ;
    for (var element in introduce) {
      if (isImage(element.toString())) {
        list.add(
          Container(
            padding: EdgeInsets.only(top: 10),
            child:Image(image: AssetImage(element.toString()),)  
          )
        );
      }else if (isLink(element.toString())) {
        list.add(
          Container(
            padding: EdgeInsets.only(top: 10),
            alignment: Alignment.centerLeft,
            child: SelectableText(element.toString()),
          )
        );
      }else {
        list.add(
          Container(
            padding: EdgeInsets.only(top: 10),
            alignment: Alignment.centerLeft,
            child:FontSizeWidget(chilText: Text(element.toString())))
        );
      }
    }
    return Column(
      children: list,
    );

  }
}



