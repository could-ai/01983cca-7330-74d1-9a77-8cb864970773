import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class LocalStorageService {
  static late SharedPreferences _preferences;

  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  // Generic method to save a list of objects
  Future<void> saveList<T>(String key, List<T> items, String Function(T) toJson) async {
    final List<String> jsonList = items.map((item) => toJson(item)).toList();
    await _preferences.setStringList(key, jsonList);
  }

  // Generic method to load a list of objects
  List<T> loadList<T>(String key, T Function(Map<String, dynamic>) fromJson) {
    final List<String>? jsonList = _preferences.getStringList(key);
    if (jsonList == null) {
      return [];
    }
    return jsonList.map((jsonString) => fromJson(json.decode(jsonString) as Map<String, dynamic>)).toList();
  }

  // Save a single string value
  Future<void> saveString(String key, String value) async {
    await _preferences.setString(key, value);
  }

  // Load a single string value
  String? loadString(String key) {
    return _preferences.getString(key);
  }

  // Save a boolean value
  Future<void> saveBool(String key, bool value) async {
    await _preferences.setBool(key, value);
  }

  // Load a boolean value
  bool? loadBool(String key) {
    return _preferences.getBool(key);
  }

  // Clear all data
  Future<void> clearAll() async {
    await _preferences.clear();
  }
}
