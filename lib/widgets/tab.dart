import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xiaobai/controllers/article_controller.dart';
import 'package:xiaobai/controllers/tab_large_controller.dart';
import 'package:xiaobai/widgets/article.dart';
import 'package:xiaobai/widgets/article_list.dart';
import 'package:xiaobai/widgets/person.dart';
import '../asset/icons/blog_icons.dart';
import '../controllers/tab_small_controller.dart';
import 'audio.dart';
import 'font_size.dart';

List<Tab> get listSmallTabs {
  return [
    Tab(icon: const Icon(BlogIcons.blogHome), child: FontSizeWidget(chilText: Text('home'.tr),),),
    Tab(icon: const Icon(BlogIcons.blogSciLine), child: FontSizeWidget(chilText: Text('scienceOnline'.tr),),),
    Tab(icon: const Icon(BlogIcons.blogPerson), child: FontSizeWidget(chilText: Text('person'.tr),),),
    Tab(icon: const Icon(BlogIcons.blogMusic), child: FontSizeWidget(chilText: Text('music'.tr),),),
    Tab(icon: const Icon(BlogIcons.blogFlutter), child: FontSizeWidget(chilText: Text('flutter'.tr),),),
    Tab(icon: const Icon(BlogIcons.blogGolang), child: FontSizeWidget(chilText: Text('golang'.tr),),),
    Tab(icon: const Icon(BlogIcons.blogJava), child: FontSizeWidget(chilText: Text('java'.tr),),),
  ];
}

List<Tab> get listLargeTabs {
  return [
    Tab(child: FontSizeWidget(chilText: Text('home'.tr),),),
    Tab(child: FontSizeWidget(chilText: Text('scienceOnline'.tr),),),
    Tab(child: FontSizeWidget(chilText: Text('flutter'.tr),),),
    Tab(child: FontSizeWidget(chilText: Text('golang'.tr),),),
    Tab(child: FontSizeWidget(chilText: Text('java'.tr),),),
  ];
}

class TabWidget extends StatelessWidget {
  final bool isLargeScreen;
  TabWidget({super.key,required this.isLargeScreen});
  final tabBlogLargeController = Get.put(TabBlogLargeController());
  final tabBlogSmallController = Get.put(TabBlogSmallController());

  @override
  Widget build(BuildContext context) {
    if (isLargeScreen) {
      return TabBar(
        //isScrollable: true,
        tabs: listLargeTabs,
        onTap: (value) => tabBlogLargeController.onTabTapped(value),
        controller: tabBlogLargeController.tabLargeController,
      );
    }else {
      return TabBar(
        isScrollable: true,
        tabs: listSmallTabs,
        onTap: (value) {
          tabBlogSmallController.onTabTapped(value);
        } ,
        controller: tabBlogSmallController.tabSmallController,
      );
    }
    
    
  }
}

class TabViewWidget extends StatelessWidget {
  final bool isLargeScreen;
  TabViewWidget({super.key,required this.isLargeScreen});
  final tabBlogLargeController = Get.put(TabBlogLargeController());
  final tabBlogSmallController = Get.put(TabBlogSmallController());
  final articleController = Get.put(ArticleController());

  @override
  Widget build (BuildContext context) {
    if (isLargeScreen) {
      return AnimatedBuilder(
      animation: tabBlogLargeController.tabLargeController, 
      builder: (context, child) {
        switch (tabBlogLargeController.tabSeletedIndex.value) {
          case 0:
          return Container(
            child: Row(
              children: [
                Expanded(child: PersonWidget()),
                Flexible(flex: 3, child: Obx(() => ArticleListWidget(tabBarIndex: tabBlogLargeController.tabSeletedIndex.value,)))
              ],
            ),
          );
          case 1:
          return Container(
            child: Row(
              children: [
                Expanded(child: PersonWidget()),
                Flexible(flex: 3, child: Obx(() => ArticleListWidget(tabBarIndex: tabBlogLargeController.tabSeletedIndex.value,)))
              ],
            ),
          );
          case 2:
          return Container(
           child: Row(
              children: [
                Expanded(child: PersonWidget()),
                Flexible(flex: 3, child: Obx(() => ArticleListWidget(tabBarIndex: tabBlogLargeController.tabSeletedIndex.value,)))
              ],
            ),
          );
          case 3:
          return Container(
            child: Row(
              children: [
                Expanded(child: PersonWidget()),
                Flexible(flex: 3, child: Obx(() => ArticleListWidget(tabBarIndex: tabBlogLargeController.tabSeletedIndex.value,)))
              ],
            ),
          );
          case 4:
          return Container(
            child: Row(
              children: [
                Expanded(child: PersonWidget()),
                Flexible(flex: 3, child: Obx(() => ArticleListWidget(tabBarIndex: tabBlogLargeController.tabSeletedIndex.value,)))
              ],
            ),
          );
          default:
          return Container(
            child: Row(
              children: [
                Expanded(child: PersonWidget()),
                Flexible(flex: 3, child: Obx(() => ArticleListWidget(tabBarIndex: tabBlogLargeController.tabSeletedIndex.value,)))
              ],
            ),
          );
        }
      }
    );
    }else {
      return AnimatedBuilder(
      animation: tabBlogSmallController.tabSmallController, 
      builder: (context, child) {
        switch (tabBlogSmallController.tabSeletedIndex.value) {
          case 0:
            return Obx(() => ArticleListWidget(tabBarIndex: tabBlogSmallController.tabSeletedIndex.value,)  ) ;
          case 1:
            return Obx(() => ArticleListWidget(tabBarIndex: tabBlogSmallController.tabSeletedIndex.value,)  ) ;
          case 2:
            return Obx(() => ArticleListWidget(tabBarIndex: tabBlogSmallController.tabSeletedIndex.value,)  ) ;
          case 3:
            return AudioWidget();
          case 4:
            return Obx(() => ArticleListWidget(tabBarIndex: tabBlogSmallController.tabSeletedIndex.value,)  ) ;
          case 5:
            return Obx(() => ArticleListWidget(tabBarIndex: tabBlogSmallController.tabSeletedIndex.value,)  ) ;
          case 6:
            return Obx(() => ArticleListWidget(tabBarIndex: tabBlogSmallController.tabSeletedIndex.value,)  ) ;
          default:
            return AudioWidget();
        }
      }
    );
    }
    
  }
}
