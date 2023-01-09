import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:aden/feature/root/controller/connectivity_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_module.dart';
import 'app_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences pref = await SharedPreferences.getInstance();

  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  return runApp(ModularApp(
      module: AppModule(pref: pref),
      child: AppWidget(
        mode: savedThemeMode,
      )));
      
}
