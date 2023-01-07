import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension UtilContext on BuildContext {
  String getPath({required String folder, required String file}) {
    return "assets/$folder/$file";
  }

  Color getScaffoldColor() {
    return Theme.of(this).scaffoldBackgroundColor;
  }
}
