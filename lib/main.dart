import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_module.dart';
import 'app_widget.dart';

void main() async {
  await Modular.isModuleReady<AppModule>();
  return runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}
