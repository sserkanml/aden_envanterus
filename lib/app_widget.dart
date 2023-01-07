import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'core/constant/pref_key.dart';
import 'core/service/cache_enum.dart';
import 'core/service/cache_service.dart';
import 'core/theme/dark_theme.dart';
import 'core/theme/light_theme.dart';

class AppWidget extends StatelessWidget {
  final AdaptiveThemeMode? mode;
  const AppWidget({
    Key? key,
    this.mode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Modular.setInitialRoute("/dashboard");
    return AdaptiveTheme(
      light: Modular.get<LightTheme>().theme,
      dark: Modular.get<DarkTheme>().theme,
      initial: mode ?? AdaptiveThemeMode.light,
      builder: (light, dark) {
        return MaterialApp.router(
            routeInformationParser: Modular.routeInformationParser,
            routerDelegate: Modular.routerDelegate,
            title: "Envanterus",
            debugShowCheckedModeBanner: false,
            darkTheme: dark,
            theme: light,
            themeMode: (Modular.get<CacheService>().getData<bool>(
                        key: Modular.get<ConstantPrefKey>().isDark,
                        cacheType: cacheEnum.bool) ??
                    false)
                ? ThemeMode.dark
                : ThemeMode.light);
      },
    );
  }
}
