import 'en_us.dart';
import 'zh_cn.dart';

abstract class Translation {
  static Map<String, Map<String, String>>
  translations =
  {
    'en_US' : enUs,
    'zh_CN' : zhCn,
  };

}