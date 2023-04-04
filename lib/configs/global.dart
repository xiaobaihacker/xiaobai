//全局配置
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xiaobai/configs/config.dart';
import 'package:xiaobai/utils/local_storage.dart';

class Global {
  //是否 release
  static const isRelease = ( bool.fromEnvironment("dart.vm.product") == true );
  static Future init() async {
    //运行初始化
    WidgetsFlutterBinding.ensureInitialized();
    //本地存储初始化
    String jsonStr = await rootBundle.loadString('lib/datas/sci.json');
    await LocalStorage.init();
    LocalStorage().setJson(envSciJson, jsonStr);
    jsonStr = await rootBundle.loadString('lib/datas/person.json');
    LocalStorage().setJson(envPersonJson, jsonStr);
    
    //初始化屏幕适配
    ScreenUtil.ensureScreenSize();

  }

}