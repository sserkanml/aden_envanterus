import 'dart:io';

import 'package:aden/core/constant/service_constant.dart';
import 'package:aden/feature/authentication/controller/user_session.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
part 'auth_mobx.g.dart';

class AuthMobx = _AuthMobxBase with _$AuthMobx;

abstract class _AuthMobxBase with Store {
  @observable
  bool isLogin = false;

  Future<void> getLogin(
      {required String email, required String password}) async {
    final url = Uri.http(Modular.get<ServiceConstant>().baseUrl,
        Modular.get<ServiceConstant>().getLogin);

    try {
      final response =
          await http.post(url, body: {"_UserName": email, "_Password": password});
      if (response.statusCode == HttpStatus.ok) {
        print(response.body);
        isLogin = response.body.toLowerCase()=="true";
        Modular.get<UserSession>().userSession =
            response.headers["set-cookie"] ?? " ";
      } else {
        print("else");
        print(response.body);
        isLogin = response.body.toLowerCase()=="false";
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
