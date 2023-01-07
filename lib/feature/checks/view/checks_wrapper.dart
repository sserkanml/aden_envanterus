import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ChecksWrapper extends StatelessWidget {
const ChecksWrapper({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: RouterOutlet(),
    );
  }
}