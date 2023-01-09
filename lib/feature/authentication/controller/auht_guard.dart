import 'dart:async';

import 'package:aden/feature/authentication/controller/auth_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../root/controller/connectivity_service.dart';

class AuthGuard extends RouteGuard {
  AuthGuard() : super(redirectTo: "/authentication/");
  @override
  FutureOr<bool> canActivate(String path, ParallelRoute route) async {
    await Modular.get<ConnectivityService>().getConnectivity();
    return Modular.get<AuthMobx>().isLogin;
  }
}
