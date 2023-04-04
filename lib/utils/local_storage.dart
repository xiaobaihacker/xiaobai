import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
class LocalStorage {
  static final LocalStorage _instance = LocalStorage._storage();
  factory LocalStorage() => _instance;
  static late SharedPreferences _prefs;

  LocalStorage._storage();

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<bool> setJson(String key,dynamic jsonVal) {
    String jsonString = jsonEncode(jsonVal);
    return _prefs.setString(key, jsonString);
  }

  dynamic getJSON(String key) {
    String? jsonString = _prefs.getString(key);
    return jsonString == null ? null : jsonDecode(jsonString);
  }

  Future<bool> setString(String key,dynamic val) {
    String valString = val.toString();
    return _prefs.setString(key, valString);
  }

  dynamic getString(String key) {
    String? valString = _prefs.getString(key);
    return valString?.toString();
  }

  Future<bool> setBool(String key, bool val) {
    return _prefs.setBool(key, val);
  }

  bool getBool(String key) {
    bool? val = _prefs.getBool(key);
    return val ?? false;
  }

  Future<bool> remove(String key) {
    return _prefs.remove(key);
  }

}