
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late  SharedPreferences sharedPreferences;

  static initCacheHelper() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> saveData({required MyCacheMy key, required dynamic value}) async {
    if (value is String) return await sharedPreferences.setString(key.name, value);
    if (value is int) return await sharedPreferences.setInt(key.name, value);
    if (value is bool) return await sharedPreferences.setBool(key.name, value);
    if(value is List<String>) return await sharedPreferences.setStringList(key.name, value);

    return await sharedPreferences.setDouble(key.name, value);
  }

  static dynamic getData({required MyCacheMy key}){
    return sharedPreferences.get(key.name);
  }

  static Future<bool> removeData ({required MyCacheMy key})async{
    return  await sharedPreferences.remove(key.name);
  }
}
enum MyCacheMy{
  startDate,endDate,room
}