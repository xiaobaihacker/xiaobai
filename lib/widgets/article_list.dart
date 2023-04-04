import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xiaobai/controllers/article_controller.dart';
import 'package:xiaobai/controllers/home_controller.dart';
import 'package:xiaobai/pages/article_page.dart';
import 'package:xiaobai/widgets/font_size.dart';

class ArticleListWidget extends StatelessWidget{
  int tabBarIndex;
  ArticleListWidget({super.key,required this.tabBarIndex});
  final homeController = Get.put(HomeController());
  final articleController = Get.put(ArticleController());
  
  @override
  Widget build(Object context) {
    if (homeController.isLargeScreen.value) {
      switch (tabBarIndex) {
        case 0: 
         return ArticleList(list: articleController.articles);
        case 1: 
          return ArticleList(list: articleController.scis);
        case 2: 
          return ArticleList(list: articleController.flutters);
        case 3: 
          return ArticleList(list: articleController.gos);
        case 4: 
          return ArticleList(list: articleController.javas);
        default: 
          return ArticleList(list: articleController.javas);
      }
    }else {
       switch (tabBarIndex) {
        case 0: 
         return ArticleList(list: articleController.articles);
        case 1: 
          return ArticleList(list: articleController.scis);
        case 2: 
          return ArticleList(list: articleController.persons);
        case 4: 
          return ArticleList(list: articleController.flutters);
        case 5: 
          return ArticleList(list: articleController.gos);
        case 6: 
          return ArticleList(list: articleController.javas);
        default: 
          return ArticleList(list: articleController.javas);
      }
      
    }
    
  }

}


class ArticleList extends StatelessWidget {
  List list;
  ArticleList({super.key,required this.list});
  final articleController = Get.put(ArticleController());

  @override
  Widget build(BuildContext context) {
    List<Widget> s = [];
    for (var element in list) {
        s.add(
          Container(
            padding: EdgeInsets.only(top: 10,left: 10,right: 10),
            child:Material(
            color: Colors.transparent,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(10)
            ),
            child:ListTile(
              onTap: () => {
                articleController.articleSelectedIndex.value = element.aticleId,
                Get.to(() =>ArticlePage())
              },
              title: Container(padding:EdgeInsets.only(top: 10), child: FontSizeWidget(chilText: Text(element.title.toString())),),
              subtitle: Container(
                padding: EdgeInsets.only(top: 10,bottom: 10),
                child: ListTile(
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
                            child: FontSizeWidget(chilText: Text(element.subTitle.toString())),
                          ),
                        )
                      ]
                    )
                  ),
                  subtitle: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ArtcleListIntroduce(introduce: element.introduce),
                      Container(padding: EdgeInsets.only(top: 10),alignment: Alignment.centerLeft,child: FontSizeWidget(chilText: Text(element.postTime.toString())),)
                    ],
                  ),
                ),
              ),
            ),
          )
          )
        );
    }
    return ListView(
      children: s,
    );
  }

}

class ArtcleListIntroduce extends StatelessWidget {
  List introduce;
  ArtcleListIntroduce({super.key,required this.introduce});
  late String introduceStr = '';

  bool isImage (String str) {
    return str.startsWith('lib/asset/images/');
  }

  @override
  Widget build(BuildContext context) {
    for (var element in introduce) {
      if (isImage(element.toString())) {
      }else {
        introduceStr = introduceStr + element;
      }
    }
    return Container(alignment: Alignment.centerLeft,padding: EdgeInsets.only(top: 10),child:FontSizeWidget(chilText: Text(introduceStr,overflow: TextOverflow.ellipsis,)),);

  }

}