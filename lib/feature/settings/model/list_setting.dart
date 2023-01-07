import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ionicons/ionicons.dart';

class SettingList {
  final String path;
  final String label;
  final IconData icon;

  SettingList({required this.path, required this.label, required this.icon});
}

List<SettingList> settingListData = [
  SettingList(
      path: "/setting-detail-user/",
      label: "Kullanıcılar",
      icon: FontAwesomeIcons.users),
  SettingList(
      path: "/setting-detail-user/create-user",
      label: "Kullanıcı Oluştur",
      icon: Ionicons.create),
  SettingList(
      path: "/setting-detail-user/system-setting",
      label: "Sistem Ayarları",
      icon: FontAwesomeIcons.gear),
  SettingList(
      path: "/setting-detail-user/my-info",
      label: "Bilgilerim",
      icon: FontAwesomeIcons.info),
  SettingList(
      path: "/setting-detail-user/alerts",
      label: "Uyarılar",
      icon: FontAwesomeIcons.exclamation),
  SettingList(path: "", label: "Çıkış Yap", icon: Ionicons.log_out),
];
