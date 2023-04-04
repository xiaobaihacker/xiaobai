import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'commons/langs/translations.dart';
import 'commons/themes.dart';
import 'configs/config.dart';
import 'configs/global.dart';
import 'routes/pages.dart';

void main () => Global.init().then((e) => runApp(const MyApp()));

class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build (BuildContext context) {
    return GetMaterialApp(
      title: envTitle,
      debugShowCheckedModeBanner: false,
      theme: Themes.nomalTheme,
      themeMode: ThemeMode.dark,
      enableLog: true,
      initialRoute: Pages.initialRoute,
      getPages: Pages.blogRoute,
      unknownRoute: Pages.unknownRoute,
      defaultTransition: Transition.fade, 
      locale: const Locale('zh','Cn'),
      translationsKeys: Translation.translations,
      builder: EasyLoading.init(),
    );
  }
}