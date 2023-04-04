import 'dart:convert';
import 'package:dart_ipify/dart_ipify.dart';
import 'package:dio/dio.dart';
import 'package:xiaobai/configs/config.dart';

import '../models/accu_model.dart';

class AccuWeather {

  static Future<AccuWratherModel> getLocationFromip (String lang) async{
      Dio dio = Dio();
      dio.options.baseUrl = envAccuWeatherBaseUrl;
      String ipaddress = await Ipify.ipv4();
      String apikey = envblogAccuWeatherKey;
      Response res ;
      res = await dio.get('/locations/v1/cities/ipaddress?apikey=$apikey&q=$ipaddress&language=zh-cn');

      Map<String,dynamic> jsonRes = jsonDecode(res.toString());
      Map<String,dynamic> jsonRegion = jsonDecode(jsonEncode(jsonRes['Region']));
      Map<String,dynamic> jsonCountry = jsonDecode(jsonEncode(jsonRes['Country']));
      Map<String,dynamic> jsonArea = jsonDecode(jsonEncode(jsonRes['AdministrativeArea']));
      Map<String,dynamic> jsonParentCity = jsonDecode(jsonEncode(jsonRes['ParentCity']));
      
      AccuWratherModel accuWeatherZh = AccuWratherModel(
        region: jsonRegion['LocalizedName'],
        country: jsonCountry['LocalizedName'],
        adminArea: jsonArea['LocalizedName'],
        parentCity: jsonParentCity['LocalizedName'],
        city: jsonRes['LocalizedName'],
      );

      AccuWratherModel accuWeatherEn = AccuWratherModel(
        region: jsonRegion['EnglishName'],
        country: jsonCountry['EnglishName'],
        adminArea: jsonArea['EnglishName'],
        parentCity: jsonParentCity['EnglishName'],
        city: jsonRes['EnglishName'],
      );

      String locationKey = jsonParentCity['Key'];
      res = await dio.get('/forecasts/v1/daily/1day/$locationKey?apikey=$apikey&language=zh-cn&metric=true');
      jsonRes = jsonDecode(res.toString());
      List<dynamic> listDaily = jsonDecode(jsonEncode(jsonRes['DailyForecasts']));
      Map<String,dynamic> jsonDaily = jsonDecode(jsonEncode(listDaily[0]));
      Map<String,dynamic> jsonPreType = jsonDecode(jsonEncode(jsonDaily['Day']));
      Map<String,dynamic> jsonTemp = jsonDecode(jsonEncode(jsonDaily['Temperature']));
      Map<String,dynamic> jsonMinTemp = jsonDecode(jsonEncode(jsonTemp['Minimum']));
      Map<String,dynamic> jsonMaxTemp = jsonDecode(jsonEncode(jsonTemp['Maximum']));
      

      accuWeatherZh.preType = jsonPreType['HasPrecipitation'];
      accuWeatherZh.maxTemp = jsonMaxTemp['Value'].toString();
      accuWeatherZh.unitTemp = jsonMaxTemp['UnitType'].toString();
      accuWeatherZh.minTemp = jsonMinTemp['Value'].toString();

      accuWeatherEn.preType = jsonPreType['HasPrecipitation'];
      accuWeatherEn.maxTemp = jsonMaxTemp['Value'].toString();
      accuWeatherEn.unitTemp = jsonMaxTemp['UnitType'].toString();
      accuWeatherEn.minTemp = jsonMinTemp['Value'].toString();
      if (lang == 'zh_Cn') {
        return accuWeatherZh;
      }else {
        return accuWeatherEn;
      }

  }

}