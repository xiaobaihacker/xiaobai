import 'package:get/get.dart';
import 'article_controller.dart';
import 'location_controller.dart';

class GlobalLangsController extends GetxController {
  final articleController = Get.put(ArticleController());
  final locationController = Get.put(LocationController());

  getChangeSources () {
    articleController.articles.clear();
    articleController.persons.clear();
    articleController.scis.clear();
    articleController.personsIndexs.clear();
    articleController.scisIndexs.clear();
    articleController.getScis();
    articleController.getPersons();
    articleController.getAll();
    locationController.getWeather();
  }
}