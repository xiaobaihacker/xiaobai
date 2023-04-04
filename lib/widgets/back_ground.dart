import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:xiaobai/controllers/back_ground_controller.dart';

import '../asset/icons/blog_icons.dart';
import 'font_size.dart';

class BackGroundWidget extends StatelessWidget {
  
  BackGroundWidget({super.key,required this.themes });
  final backGroundController = Get.put(BackGroundController());
  String themes ;
  final seaTween = MovieTween()..scene(duration: const Duration(seconds: 10))
  .tween('color1', ColorTween(begin: const Color.fromRGBO(144, 202, 249, 1),end: const Color.fromRGBO(66, 165, 245, 1)));
  final qicaiTween = MovieTween()..scene(duration: const Duration(seconds: 10))
  .tween('color1', ColorTween(begin: const Color(0xffD38312),end: Colors.lightBlue.shade900))
  .tween('color2', ColorTween(begin: const Color(0xffA83279),end: Colors.blue.shade600));

  @override
  Widget build(BuildContext context) {
    switch(themes){
      case 'nomalSea': 
        return Container( 
                decoration:  const BoxDecoration(
                  gradient: LinearGradient( 
                    colors: [Color.fromRGBO(144, 202, 249, 1), Color.fromRGBO(66, 165, 245, 1)], 
                    begin: Alignment.topCenter, 
                    end: Alignment.bottomCenter, 
                  ), 
                ), 
              );
      case 'nomalQiCai': 
        return Container(
                decoration:  BoxDecoration(
                  gradient: LinearGradient(
                    colors: [const Color(0xffD38312),Colors.lightBlue.shade900,const Color(0xffA83279),Colors.blue.shade600],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              );
      case 'gradientRotate': 
        return LoopAnimationBuilder<double>(
                tween: Tween(begin: 0.0,end: 2 * pi), 
                duration: const Duration(seconds: 10),
                builder: (context, value, child ) {
                  return Transform.rotate(
                    angle: value,
                    child: Container(color: Colors.redAccent),
                  );
                }, 
              );
      case 'gradientSea': 
        return LoopAnimationBuilder<Movie>(
                tween: seaTween,
                duration: seaTween.duration,
                builder: (context, value, child ) {
                  return Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter, 
                        end: Alignment.bottomCenter,
                        colors: [value.get('color1'),value.get('color1')],
                      ),
                    ),
                  );
                }, 
              );
      case 'gradientQiCai': 
        return LoopAnimationBuilder<Movie>(
                tween: qicaiTween,
                duration: qicaiTween.duration,
                builder: (context, value, child ) {
                  return Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [value.get('color1'),value.get('color2')],
                      ),
                    ),
                  );
                }, 
              );
      default: 
        return Container( 
                decoration:  const BoxDecoration(
                  gradient: LinearGradient( 
                    colors: [Color.fromRGBO(144, 202, 249, 1), Color.fromRGBO(66, 165, 245, 1)], 
                    begin: Alignment.topCenter, 
                    end: Alignment.bottomCenter, 
                  ), 
                ), 
              );
    }
  }
}

class BackGroundPopupMenu extends StatelessWidget {
  BackGroundPopupMenu({super.key});
  final backGroundController = Get.put(BackGroundController());

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: const Icon(BlogIcons.blogTheme),
      tooltip: 'theme'.tr,
      padding: EdgeInsets.zero,
      itemBuilder: (BuildContext context ) {
        return [
            PopupMenuItem(
              value: 'nomalSea',
              child: Material(
                shape: const StadiumBorder(side: BorderSide()),
                child: FontSizeWidget(chilText: Text(' ${'nomalSea'.tr} '),)
              ),
            ),
            PopupMenuItem(
              value: 'nomalQiCai',
              child: Material(
                shape: const StadiumBorder(side: BorderSide()),
                child: FontSizeWidget(chilText: Text(' ${'nomalQiCai'.tr} '),)
              ),
            ),
            PopupMenuItem(
              value: 'gradientRotate',
              child: Material(
                shape: const StadiumBorder(side: BorderSide()),
                child: FontSizeWidget(chilText: Text(' ${'gradientRotate'.tr} '),)
              ),
            ),
            PopupMenuItem(
              value: 'gradientSea',
              child: Material(
                shape: const StadiumBorder(side: BorderSide()),
                child: FontSizeWidget(chilText: Text(' ${'gradientSea'.tr} '),)
              ),
            ),
            PopupMenuItem(
              value: 'gradientQiCai',
              child: Material(
                shape: const StadiumBorder(side: BorderSide()),
                child: FontSizeWidget(chilText: Text(' ${'gradientQiCai'.tr} '),)
              ),
            ),
        ];
      },
      onSelected: (object) {
          backGroundController.changeTheme(object);
        },
    );
  }

}