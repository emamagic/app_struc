
import 'package:app_struc/core/constants/general.dart';
import 'package:app_struc/core/exceptions/exceptions.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Pref {

  static set(String key, dynamic input) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(input is String) {
      prefs.setString(key, input);
    } else if(input is bool) {
      prefs.setBool(key, input);
    } else if(input is double) {
      prefs.setDouble(key, input);
    } else if(input is int) {
      prefs.setInt(key, input);
    } else if(input is List<String>) {
      prefs.setStringList(key, input);
    } else {
      throw PrefsException(unknownInputCast);
    }
  }

  static Future<dynamic> get(dynamic key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
     return prefs.get(key) ?? NOT_EXIST;
  }

  static remove(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

  static clean() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  static Future<bool> containsKey(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(key);
  }


}