import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TabModel{
  final IconData icon;

  TabModel({required  this.icon});
}


List<TabModel> tabs=[
  TabModel(icon: FontAwesomeIcons.barsProgress),
  TabModel(icon: FontAwesomeIcons.users),
  TabModel(icon: FontAwesomeIcons.images),
  TabModel(icon: FontAwesomeIcons.bars),
];