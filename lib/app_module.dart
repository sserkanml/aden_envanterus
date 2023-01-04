import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/constant/pref_key.dart';
import 'core/constant/service_constant.dart';
import 'core/service/cache_service.dart';
import 'core/theme/dark_theme.dart';
import 'core/theme/light_theme.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.lazySingleton<DarkTheme>((i) => i()),
        Bind.lazySingleton<LightTheme>((i) => i()),
        Bind.lazySingleton<ServiceConstant>((i) => i()),
        Bind.lazySingleton<ConstantPrefKey>((i) => i()),
        Bind.lazySingleton<CacheService>((i) => i()),
        AsyncBind<SharedPreferences>(
          (i) => SharedPreferences.getInstance(),
        )
      ];

  @override
  List<ModularRoute> get routes => [];
}
