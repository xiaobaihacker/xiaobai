import 'package:get/get.dart';
import 'package:xiaobai/controllers/back_ground_controller.dart';
import 'package:xiaobai/controllers/font_size_controller.dart';
import 'package:xiaobai/controllers/global_langs_controller.dart';
import 'package:xiaobai/controllers/home_controller.dart';
import 'package:xiaobai/controllers/location_controller.dart';
import 'package:xiaobai/controllers/article_write_controller.dart';

import 'article_controller.dart';
import 'audio_controller.dart';
import 'tab_large_controller.dart';
import 'tab_small_controller.dart';

class BaseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => BackGroundController());
    Get.lazyPut(() => FontSizeController());
    Get.lazyPut(() => TabBlogLargeController());
    Get.lazyPut(() => TabBlogSmallController());
    Get.lazyPut(() => ArticleController());
    Get.lazyPut(() => LocationController());
    Get.lazyPut(() => GlobalLangsController());
    Get.lazyPut(() => AudioController());
    //Get.lazyPut(() => ArticleWriteController());
  }
  
}