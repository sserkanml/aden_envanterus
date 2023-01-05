import 'package:flutter/cupertino.dart';

extension UtilContext on BuildContext {
  String getPath({required String folder, required String file}) {
    return "assets/$folder/$file";
  }
}
