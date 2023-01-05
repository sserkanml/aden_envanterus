import 'package:aden/feature/authentication/controller/auht_guard.dart';
import 'package:aden/feature/checks/view/chekcs_page.dart';
import 'package:aden/feature/customers/view/customer_page.dart';
import 'package:aden/feature/projects/view/projects_page.dart';
import 'package:aden/feature/root/view/dashboard_page.dart';
import 'package:aden/feature/root/view/root_page.dart';
import 'package:aden/feature/settings/view/setting_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RootModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute("/",
            guards: [AuthGuard()],
            transition: TransitionType.noTransition,
            child: (context, args) => const RootPage(),
            children: [
              ChildRoute(
                "/dashboard",
                child: (context, args) => const DashboardPage(),
              ),
              ChildRoute(
                "/checks",
                child: (context, args) => const ChekcsPage(),
              ),
              ChildRoute(
                "/customers",
                child: (context, args) => const CustomerPage(),
              ),
              ChildRoute(
                "/projects",
                child: (context, args) => const ProjectsPage(),
              ),
              ChildRoute(
                "/settings",
                child: (context, args) => const SettingPage(),
              ),
            ])
      ];
}
