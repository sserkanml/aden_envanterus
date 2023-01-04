import 'cache_enum.dart';
import 'i_cache.dart';

class CacheService extends IcacheService {
  CacheService() : super();

  @override
  T? getData<T extends Object>(
      {required String key, required cacheEnum cacheType}) {
    switch (cacheType) {
      case cacheEnum.bool:
        return super.pref.getBool(key) as T;

      case cacheEnum.string:
        return super.pref.getString(key) as T;

      case cacheEnum.int:
        return super.pref.getInt(key) as T;
      case cacheEnum.double:
        return super.pref.getInt(key) as T;
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
        return super.pref.setBool(key, value);
      case cacheEnum.string:
        String value = data as String;
        return super.pref.setString(key, value);
      case cacheEnum.int:
        int value = data as int;
        return super.pref.setInt(key, value);
      case cacheEnum.double:
        double value = data as double;
        return super.pref.setDouble(key, value);
    }
  }
}
