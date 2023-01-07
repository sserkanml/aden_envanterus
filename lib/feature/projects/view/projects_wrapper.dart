import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProjectsWrapper extends StatelessWidget {
const ProjectsWrapper({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: RouterOutlet(),
    );
  }
}