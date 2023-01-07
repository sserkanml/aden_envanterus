import 'package:aden/feature/settings/controller/setting_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SettingsWrapper extends StatefulWidget {
  const SettingsWrapper({Key? key}) : super(key: key);

  @override
  State<SettingsWrapper> createState() => _SettingsWrapperState();
}

class _SettingsWrapperState extends State<SettingsWrapper> {
  @override
  void dispose() {
    
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: RouterOutlet(),
    );
  }
}
