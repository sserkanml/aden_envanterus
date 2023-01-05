import 'package:flutter_modular/flutter_modular.dart';
import "package:shared_preferences/shared_preferences.dart";

import 'cache_enum.dart';

abstract class IcacheService {
 

  T? getData<T extends Object>({required String key,required cacheEnum cacheType});
  Future<bool> setData<T extends Object>(
      {required String key, required T data,required cacheEnum cacheType});
}
