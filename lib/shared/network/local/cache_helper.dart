import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? sharedPreferences;


   static initi()async{
     sharedPreferences =await SharedPreferences.getInstance();
   }
  static Future<bool> putData({
    required String key,
    required bool value,})async
  {
    return await sharedPreferences!.setBool(key, value);
  }

  static Future<bool?> getData({
    required String key,
    })async
  {
    return await sharedPreferences!.getBool(key);
  }
}
