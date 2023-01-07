import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DashboardWrapper extends StatelessWidget {
const DashboardWrapper({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: RouterOutlet(),
    );
  }
}