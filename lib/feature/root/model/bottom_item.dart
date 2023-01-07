import 'package:aden/core/logic/navigation.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class BottomItemModel {
  final String label;
  final String path;
  final IconData icon;

  BottomItemModel(
      {required this.label, required this.path, required this.icon});
}

List<BottomItemModel> bottomData = [
  BottomItemModel(
      label: "Dashboard", path: "/dashboard", icon: Icons.dashboard),
  BottomItemModel(label: "Sayımlar", path: "/checks", icon: LineIcons.archive),
  BottomItemModel(
      label: "Müşteriler", path: "/customers", icon: LineIcons.users),
  BottomItemModel(
      label: "Projeler", path: "/projects", icon: LineIcons.projectDiagram),
  BottomItemModel(label: "Ayarlar", path: "/settings" , icon: LineIcons.cog),
];
