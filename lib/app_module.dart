import 'package:aden/feature/root/controller/root_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/constant/pref_key.dart';
import 'core/constant/service_constant.dart';
import 'core/service/cache_service.dart';
import 'core/theme/dark_theme.dart';
import 'core/theme/light_theme.dart';
import 'feature/authentication/controller/auth_module.dart';

class AppModule extends Module {
  final SharedPreferences pref;

  AppModule({required this.pref});
  @override
  List<Bind<Object>> get binds => [
        Bind.lazySingleton<DarkTheme>((i) => DarkTheme()),
        Bind.lazySingleton<LightTheme>((i) => LightTheme()),
        Bind.lazySingleton<ServiceConstant>((i) => ServiceConstant()),
        Bind.lazySingleton<ConstantPrefKey>((i) => ConstantPrefKey()),
        Bind.lazySingleton<CacheService>((i) => CacheService(pref)),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute("/", module: RootModule()),
        ModuleRoute("/authentication", module: AuhtModule())
      ];
}
