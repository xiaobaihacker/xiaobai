import 'package:flutter/material.dart';

class Themes {

  //普通模板
  static final nomalTheme = ThemeData.dark().copyWith(
    //设置 scaffold 背景色透明
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
      //设置 appBar 背景色透明
      backgroundColor: Colors.transparent,
      //设置appBar 阴影为0 ，造成appBar 和全屏界面有分层
      elevation: 0,
    ),
    popupMenuTheme: PopupMenuThemeData(
      color: Colors.transparent,
      elevation: 0.0,
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Colors.white),
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        
      ),
    ),  
  );


}