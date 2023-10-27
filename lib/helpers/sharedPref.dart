// ignore_for_file: constant_identifier_names, empty_catches, prefer_const_constructors, unnecessary_brace_in_string_interps, avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';


class PreferenceUtils {
  static Future<SharedPreferences> get _instance async => _prefsInstance ??= await SharedPreferences.getInstance();
  static SharedPreferences? _prefsInstance;


  static const String CITY_ID = 'city_id';
  static const String COUNTRY_ID = 'country_id';
  static const String FCM_TOKEN = 'fcm_token';
  static const String USER_IS_LOGGED = 'user_is_logged';
  static const String USER_PHONE_NUM = 'user_phone_num';
  static const String USER_DATA = 'user_data';
  static const String CURRENT_LOCAL = 'current_local';
  static const String MY_LOCATION = 'my_location';




  // call this method from iniState() function of mainApp().
  static Future<SharedPreferences> init() async {
    _prefsInstance = await _instance;
    return _prefsInstance!;
  }

  static String getString(String key, [String? defValue]) {
    return _prefsInstance!.getString(key) ?? defValue ?? "";
  }

  static Future<bool> setString(String key, String value) async {
    var prefs = await _instance;
    return prefs.setString(key, value);
  }

  static Future<void> setCityCountry(cityId, countryId) async{
    try {
      await _prefsInstance!.setString(CITY_ID,  cityId.toString());
      await _prefsInstance!.setString(COUNTRY_ID,  countryId.toString());
    } catch (error) {
      Logger().e(error);
    }
  }


  static Map<String, int>? getCityCountry()  {
    try {
      final cityId =  _prefsInstance!.getString(CITY_ID);
      final countryId =  _prefsInstance!.getString(COUNTRY_ID);
      return {"cityId":int.parse(cityId!),"countryId":int.parse(countryId!)};
    } catch (error) {
      Logger().e(error);
    }
    return null;
  }


  ///save fcm token
  static void setFcmToken(String token) {
    try {
      _prefsInstance!.setString(FCM_TOKEN, token);
    } catch (error) {
      print('ERRROR +> ${error}');
    }
  }

  /// get user fcm token
  static String? getFcmToken() {
    try {
      return _prefsInstance!.getString(FCM_TOKEN);
    } catch (error) {
      print('ERRROR +> ${error}');
    }
    return null;
  }

 


  /// get user renaining times to convert
  static bool getUserIsLogged() {
    try {
      bool? value = _prefsInstance!.getBool(USER_IS_LOGGED);
      return value ?? false;
    } catch (error) {
      Logger().e('getUserIsLogged => $error');
    }
    return false;
  }

  /// get user phone number
  static String? getPhoneNumber() {
    try {
      String? value = _prefsInstance!.getString(USER_PHONE_NUM);
      return value ;
    } catch (error) {}
    return null;
  }



  ///save fcm token
  static void setCurrentLocale(Locale locale) {
    try {
      Logger().e(locale.languageCode);
      _prefsInstance!.setString(CURRENT_LOCAL, locale.languageCode);
    } catch (error) {
      print('ERRROR +> ${error}');
    }
  }

  /// get user fcm token
  static Locale getCurrentLocale() {
    try {
      String? langCode = _prefsInstance!.getString(CURRENT_LOCAL);
      if (langCode != null) {
        if (langCode == 'ar') {
          return Locale('ar', 'AR');
        } else {
          return Locale('en', 'US');
        }
      }
    } catch (error) {
      Logger().e(error);
    }
    //return Get.deviceLocale ?? Locale('en', 'US');
    return Locale('ar', 'AR');
  }


  static void saveListWithGetStorage(String storageKey, List<dynamic> storageValue) async => await _prefsInstance!.setString(storageKey, jsonEncode(storageValue));



  static  deleteLocations(int id) {
    Logger().w(id);
    try{
      /// getting all saved data
      String? oldSavedData = _prefsInstance!.getString(MY_LOCATION);

      /// in case there is saved data
      if(oldSavedData != null){
        /// create a holder list for the old data
        List<dynamic> oldSavedList = json.decode(oldSavedData);
        Logger().w(oldSavedList.toString());
        /// append the new list to saved one
        oldSavedList.removeWhere((element) => element["id"] == id);
        /// save the new collection
        return saveListWithGetStorage(MY_LOCATION, oldSavedList);
      }
    }catch(e){
      Logger().w(e);
    }

  }

}
