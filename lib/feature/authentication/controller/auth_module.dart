import 'package:aden/feature/authentication/view/forgotten_page.dart';
import 'package:aden/feature/authentication/view/login_page.dart';
import 'package:aden/feature/authentication/view/signup_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuhtModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          "/",
          child: (context, args) => const LoginPage(),
        ),
        ChildRoute(
          "/sign-up",
          child: (context, args) => const SignupPage(),
        ),
        ChildRoute(
          "/forgotten-paswword",
          child: (context, args) => const ForgottenPage(),
        ),
      ];
}
