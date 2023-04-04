import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../models/accu_model.dart';
import '../services/accu_server.dart';

class LocationController extends GetxController {
  //天气
  Rx<AccuWratherModel> accuWratherModel = AccuWratherModel().obs;
  getWeather () async {
    try {
      accuWratherModel.value = await AccuWeather.getLocationFromip(Get.locale.toString());
    } catch (e) {
      EasyLoading.showError('noLocation'.tr);
    }
    
  }

  //location获得距离周末的时间
  final untilSaturday = 0.obs;
  final isWeekend = false.obs;
  daysUntiilSaturday () {
    untilSaturday.value = 6 - DateTime.now().weekday;
    if (untilSaturday.value > 0) {
      
    }else {
      isWeekend.value = true;
    }
  }

  @override
  void onInit() {
    super.onInit();
    getWeather();
    daysUntiilSaturday();
  }
}