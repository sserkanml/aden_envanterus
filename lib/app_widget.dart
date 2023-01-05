import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'core/constant/pref_key.dart';
import 'core/service/cache_enum.dart';
import 'core/service/cache_service.dart';
import 'core/theme/dark_theme.dart';
import 'core/theme/light_theme.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Modular.setInitialRoute("/dashboard");
    return MaterialApp.router(
        routeInformationParser: Modular.routeInformationParser,
        routerDelegate: Modular.routerDelegate,
        title: "Envanterus",
        debugShowCheckedModeBanner: false,
        darkTheme: Modular.get<DarkTheme>().theme,
        theme: Modular.get<LightTheme>().theme,
        themeMode: (Modular.get<CacheService>().getData<bool>(
                    key: Modular.get<ConstantPrefKey>().isDark,
                    cacheType: cacheEnum.bool) ??
                false)
            ? ThemeMode.dark
            : ThemeMode.light);
  }
}
