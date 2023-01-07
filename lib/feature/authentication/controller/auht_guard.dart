import 'dart:async';

import 'package:aden/feature/authentication/controller/auth_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthGuard extends RouteGuard {
  AuthGuard() : super(redirectTo: "/authentication/");
  @override
  FutureOr<bool> canActivate(String path, ParallelRoute route) {
    return Modular.get<AuthMobx>().isLogin;
  }
}
