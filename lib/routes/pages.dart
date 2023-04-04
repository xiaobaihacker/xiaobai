import 'package:get/get.dart';
import 'package:xiaobai/controllers/base_bindings.dart';
import 'package:xiaobai/pages/article_page.dart';
import 'package:xiaobai/pages/article_write_page.dart';
import 'package:xiaobai/routes/routes.dart';

import '../pages/home_page.dart';
import '../pages/notfound_page.dart';

class Pages {
  static  String initialRoute = Routes.home;

  static final blogRoute = [
    GetPage(
      name: Routes.home,
      page: () => HomePage(),
      binding: BaseBinding()
    ),
    GetPage(
      name: Routes.article,
      page: () => ArticlePage(),
    ),
    GetPage(
      name: Routes.articleWrite,
      page: () => ArticleWritePage(),
    ),
  ];

  static final unknownRoute = GetPage(
    name: Routes.notFound,
    page: () => const NotfoundPage(),
  );
}