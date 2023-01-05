import 'package:shared_preferences/shared_preferences.dart';

import 'cache_enum.dart';
import 'i_cache.dart';

class CacheService extends IcacheService {
  final SharedPreferences pref;
  CacheService(this.pref) : super();

  @override
  T? getData<T extends Object>(
      {required String key, required cacheEnum cacheType}) {
    switch (cacheType) {
      case cacheEnum.bool:
        return pref.getBool(key) as T?;

      case cacheEnum.string:
        return pref.getString(key) as T?;

      case cacheEnum.int:
        return pref.getInt(key) as T?;
      case cacheEnum.double:
        return pref.getInt(key) as T?;
    }
  }

  @override
  Future<bool> setData<T extends Object>(
      {required String key,
      required T data,
      required cacheEnum cacheType}) async {
    switch (cacheType) {
      case cacheEnum.bool:
        bool value = data as bool;
        return pref.setBool(key, value);
      case cacheEnum.string:
        String value = data as String;
        return pref.setString(key, value);
      case cacheEnum.int:
        int value = data as int;
        return pref.setInt(key, value);
      case cacheEnum.double:
        double value = data as double;
        return pref.setDouble(key, value);
    }
  }
}
