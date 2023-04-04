import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xiaobai/models/article_model.dart';
import 'package:xiaobai/models/person_model.dart';
import 'package:xiaobai/widgets/font_size.dart';

import '../configs/config.dart';
import '../models/sci_model.dart';
import '../utils/local_storage.dart';

class ArticleController extends GetxController {
  RxList scis = [].obs;
  RxList scisIndexs = [].obs;
  RxList persons = [].obs;
  RxList personsIndexs = [].obs;
  RxList flutters = [].obs;
  RxList fluttersIndexs = [].obs;
  RxList gos = [].obs;
  RxList gosIndexs = [].obs;
  RxList javas = [].obs;
  RxList javasIndexs = [].obs;
  RxList articles = [].obs;
  RxInt articleNum = 0.obs;
  RxInt articleIndex = 0.obs;
  RxInt articleSelectedIndex = 0.obs;
  late int index ;
  late List temp = [];
  Widget  getPersonsFeel () {
    switch ( DateTime.now().weekday) {
    case 1: 
      return FontSizeWidget(chilText: Text('mondayFeel'.tr));
    case 2: 
      return FontSizeWidget(chilText: Text('tuesdayFeel'.tr));
    case 3: 
      return FontSizeWidget(chilText: Text('wednesdayFeel'.tr));
    case 4: 
      return FontSizeWidget(chilText: Text('thursdayFeel'.tr));
    case 5: 
      return FontSizeWidget(chilText: Text('fridayFeel'.tr));
    default: 
      return FontSizeWidget(chilText: Text('weekendFeel'.tr));
  }
  }

  getScis () {
    final jsonRes = json.decode(LocalStorage().getJSON(envSciJson));
      for(Map<String,dynamic> map in jsonRes) {
          temp.add(SciOnlineModel.fromJson(map));
      }
      for (var element in temp) {
        if (element.langs == Get.locale.toString()){
          scis.add(element);
        }
      }
      temp.clear();
      for (var element in scis) {
          index = articleIndex.value;
          element.aticleId = index +1;
          articleIndex.value = element.aticleId!;
          scisIndexs.value.add(element.aticleId);
      }
      scis.sort(((a, b) => (b.postTime!).compareTo(a.postTime!)));
      
  }

  getPersons () {
    final jsonRes = json.decode(LocalStorage().getJSON(envPersonJson));
      for(Map<String,dynamic> map in jsonRes) {
          temp.add(PersonModel.fromJson(map));
      }  
      for (var element in temp) {
        if (element.langs == Get.locale.toString()){
          persons.add(element);
        }
      }
      temp.clear();
      for (var element in persons) {
          index = articleIndex.value;
          element.aticleId = index +1;
          articleIndex.value = element.aticleId!;
          personsIndexs.value.add(element.aticleId);
      }
      persons.sort(((a, b) => (b.postTime!).compareTo(a.postTime!)));
      
  }

  getAll () {
    for (var element in persons) {
      articles.add(ArticleModel(
        aticleId:element.aticleId,
        title:element.title,
        subTitle:element.subTitle,
        postTime:element.postTime,
        langs:element.langs,
        introduce:element.introduce,
      ));
    }
    for (var element in scis) {
      articles.add(ArticleModel(
        aticleId:element.aticleId,
        title:element.title,
        subTitle:element.subTitle,
        postTime:element.postTime,
        langs:element.langs,
        introduce:element.introduce,
      ));
    }
    articleNum.value = scis.length + persons.length;
  }

  @override
  void onInit() {
    super.onInit();
    getScis();
    getPersons ();
    getAll();
  }

}